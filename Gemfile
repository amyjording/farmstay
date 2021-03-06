source 'http://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.4.4"
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
gem 'pg'
gem 'devise'
gem 'pundit'
gem 'omniauth-instagram'
gem 'omniauth-facebook'
gem 'therubyracer', platforms: :ruby
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'bootstrap-sass', '3.3.6'
gem 'sass-rails', '~> 5.0', '>= 5.0.4'
gem 'jquery-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '3.1.12'
#gem 'webdrivers', '~> 3.0'

gem "shrine", "~> 2.0"
gem 'carrierwave', '1.2.2'
gem 'mini_magick', '4.7.0'
gem "aws-sdk-s3"
gem 'figaro'

group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'capybara-email'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'database_cleaner', '~> 1.6.1.0'
  gem 'letter_opener'
  gem 'rspec-rails', '~> 3.7'
  gem 'pry'
  gem 'pry-nav'
  gem 'pry-rails', '~> 0.3.2'
  gem 'selenium-webdriver', '~> 3.12'
  gem 'simple_bdd'
  gem 'shoulda-matchers'
  gem 'spring'
  gem 'capistrano', '~> 3.10.1'
  gem 'capistrano-rails'
  gem 'capistrano-passenger'
  gem 'capistrano-secrets-yml', '~> 1.1.0'
  gem 'capistrano-figaro-yml', '~> 1.0.2'
  gem 'rails-controller-testing'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

group :production do
  gem 'fog-aws'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
