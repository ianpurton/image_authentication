require 'image_authentication/version'
require 'devise'
require 'active_support/concern'

module Devise
  mattr_accessor :lock_after_failed_attempts
  @@lock_after_failed_attempts = false

  mattr_accessor :number_of_categories
  @@number_of_categories = 20

  mattr_accessor :maximum_categories
  @@maximum_categories = 3
end

module ImageAuthentication
  module Controllers
    autoload :Helpers, 'image_authentication/controllers/helpers'
  end
end

Devise.add_module :image_authenticatable, :model => 'image_authentication/models/image_authenticatable', :controller => :image_authentication, :route => :image_authentication

require 'image_authentication/routes'
require 'image_authentication/models/image_authenticatable'
require 'image_authentication/rails'