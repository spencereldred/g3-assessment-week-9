require_relative "./../to_do_app"
require "capybara/rspec"
require "database_cleaner"
ENV["RACK_ENV"] = "test"

Capybara.app = ToDoApp

RSpec.configure do |config|

  config.before(:suite) do
    GschoolDatabaseConnection::DatabaseConnection.establish(ENV["RACK_ENV"])
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
