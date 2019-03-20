# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'bundler', '>= 1.6.0'
gem 'carrierwave'
gem 'devise'
gem 'file_validators'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'mysql2'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.2'
gem 'sass-rails', '~> 5.0'
gem 'slim', '3.0.9'
gem 'slim-rails'
gem 'uglifier', '>= 1.3.0'
gem 'unicorn'
gem 'virtus'
gem 'webpacker'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'guard', require: false
  gem 'guard-brakeman', require: false
  gem 'guard-foreman', require: false
  gem 'guard-livereload', require: false
  gem 'guard-rails', require: false
  gem 'guard-rspec', require: false
  gem 'guard-rubocop', require: false
  gem 'hirb'
  gem 'hirb-unicode-steakknife'
  gem 'rspec-rails'
end

group :development do
  gem 'foreman'
  gem 'html2slim'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
  gem 'slim_lint', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'chromedriver-helper'
  gem 'rails-controller-testing'
  gem 'rubocop-checkstyle_formatter', require: false
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
end

group :deployment do
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
