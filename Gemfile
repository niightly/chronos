source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'awesome_print', '~> 1.8'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bson_ext'
gem 'haml', '~> 5.0', '>= 5.0.4'
gem 'haml-rails', '~> 1.0'
gem 'httparty', '~> 0.16.3'
gem 'jbuilder', '~> 2.8'
gem 'json-schema', '~> 2.8', '>= 2.8.1'
gem 'mongoid', '~> 7.0.2'
gem 'mongoid_rails_migrations', '~> 1.2'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.1', '>= 5.2.1.1'
gem 'sass-rails', '~> 5.0'
gem 'sidekiq', '~> 5.2', '>= 5.2.3'
gem 'sidekiq-scheduler', '~> 3.0'
gem 'sinatra', '~> 2.0', '>= 2.0.4', require: nil
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'

group :development, :test do
	gem 'byebug', platforms: %i[mri mingw x64_mingw]
	gem 'factory_bot_rails', '~> 4.11', '>= 4.11.1', require: false
	gem 'faker', git: 'https://github.com/stympy/faker'
	gem 'guard-rspec', '~> 4.7', '>= 4.7.3', require: false
	gem 'rspec-rails', '~> 3.8', '>= 3.8.1'
	gem 'rubocop', '~> 0.60.0', require: false
end

group :development do
	gem 'brakeman', '~> 4.3', '>= 4.3.1'
	gem 'bundler-audit', '~> 0.6.0'
	gem 'haml_lint', '~> 0.28.0'
	gem 'listen', '>= 3.0.5', '< 3.2'
	gem 'spring'
	gem 'spring-watcher-listen', '~> 2.0.0'
	gem 'web-console', '>= 3.3.0'
end

group :test do
	gem 'capybara', '>= 2.15'
	gem 'chromedriver-helper'
	gem 'database_cleaner', '~> 1.7'
	gem 'selenium-webdriver'
	gem 'simplecov', '~> 0.16.1'
	gem 'simplecov-console', '~> 0.4.2'
	gem 'webmock', '~> 3.4', '>= 3.4.2'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
