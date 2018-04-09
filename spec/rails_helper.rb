# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rspec'
require 'simple_bdd'
require 'shoulda/matchers'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.clean
  end

  config.include SimpleBdd, type: :feature

  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end

  end

  #Capybara.register_driver :selenium do |app|  
  #  require 'selenium/webdriver'  
  #  Selenium::WebDriver::Firefox::Binary.path = "C:/Users/ADMIN/the_odin_project/Rails/Firefox52"  
  #  Capybara::Selenium::Driver.new(app, :browser => :firefox)
  #end

 # Capybara.register_driver :selenium do |app|
 #   browser_options = ::Selenium::WebDriver::Firefox::Options.new()
 #   browser_options.args << '--headless'

#    Capybara::Selenium::Driver.new(
#      app,
#      browser: :firefox,
#      options: browser_options
#    )
#   end

  OmniAuth.config.test_mode = true
  
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      provider: 'facebook',
      uid: '123545',
      user_info: {
        email: 'mockuser@example.com',
        name: 'Mock User',
        first_name: 'Mock',
        last_name: "User",
        image: "...",
        }
    })

  OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(
    {
      provider: 'twitter',
      uid: '12345',
      info:  { name: 'mockuser'},
      extra: { access_token: { token: "a token", secret: "a secret"} }
    })
  
  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end
