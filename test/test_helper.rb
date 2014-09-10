# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"
# require 'database_cleaner'
require 'factory_girl_rails'
include FactoryGirl::Syntax::Methods

# DatabaseCleaner.strategy = :transaction

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Load fixtures from the engine
if ActiveSupport::TestCase.method_defined?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
end

# class ActiveSupport::TestCase
#   ActiveRecord::Migration.check_pending!
#   
#   setup do
#    DatabaseCleaner.start
#   end
# 
#   teardown do
#    DatabaseCleaner.clean
#   end
# end


class ActionController::TestCase
  setup do
    @routes = Supportify::Engine.routes
  end
end