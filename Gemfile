# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

gem 'bootsnap', require: false
gem 'devise'
gem 'gon'
gem 'importmap-rails'
gem 'jbuilder'
gem 'pg'
gem 'puma', '~> 5.6'
gem 'rails', '~> 7.0.4'
gem 'rails-i18n'
gem 'redis', '~> 4.0'
gem 'roo-xls'
gem 'rubocop'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'letter_opener'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rubocop-airbnb'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
