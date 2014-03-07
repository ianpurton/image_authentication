ENV["RAILS_ENV"] = "test"

require 'coveralls'

Coveralls.wear!('rails')

require File.expand_path("dummy/config/environment.rb",  File.dirname(__FILE__))
require 'rspec/rails'
require 'factory_girl_rails'

Dir[File.expand_path("support/**/*.rb", File.dirname(__FILE__))].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.include FactoryGirl::Syntax::Methods
end
