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
require 'pundit/rspec'

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

  config.include Warden::Test::Helpers
    config.before :suite do 
      Warden.test_mode!
  end

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

  config.after(:suite) do
    FileUtils.rm_rf(Dir["#{Rails.root}/spec/test_files/"])
  end

end
