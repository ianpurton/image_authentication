require 'rails/generators/active_record'

module ActiveRecord
  module Generators
    class ImageAuthenticationGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def copy_image_authentication_migration
        migration_template "migration.rb", "db/migrate/image_authentication_add_to_#{table_name}"
      end

    end
  end
end