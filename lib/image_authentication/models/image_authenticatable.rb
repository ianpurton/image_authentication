require 'image_authentication/hooks/image_authentication'

module Devise
  module Models
    module ImageAuthenticatable
      extend ActiveSupport::Concern

      Categories = [
        'Aeroplanes',
        'Beverages',
        'Bicycles',
        'Birds',
        'Boats',
        'Cars',
        'Cats',
        'Clocks',
        'Dogs',
        'Fish',
        'Flowers',
        'Food',
        'Furniture',
        'Houses',
        'Insects',
        'Money',
        'People',
        'Shoes',
        'Telephones',
        'Trains'
      ]

      module ClassMethods
        ::Devise::Models.config(self, :lock_after_failed_attempts, :number_of_categories, :maximum_categories)
      end

      def auth_categories=(categories)
        self.auth_categories_mask = (categories & Categories).map { |c| 2**Categories.index(c) }.sum
      end

      def auth_categories
        Categories.reject { |c| ((auth_categories_mask || 0 ) & 2**Categories.index(c)).zero? }
      end

      def valid_images?(categories)
        return false if categories.nil?

        (categories - auth_categories).empty?
      end

      def all_auth_categories
        Categories.shuffle[0..self.class.number_of_categories]
      end

      def max_login_attempts?
        self.class.lock_after_failed_attempts && (failed_attempts >= self.class.maximum_attempts)
      end
    end
  end
end
