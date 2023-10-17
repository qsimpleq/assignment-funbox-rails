# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'
gem 'dotenv-rails', groups: %i[development test]

gem 'puma', '~> 6' # Use the Puma web server [https://github.com/puma/puma]
gem 'rails', '~> 7.1' # Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"

gem 'cssbundling-rails' # Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem 'importmap-rails'
gem 'jbuilder' # Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jsbundling-rails' # Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem 'sprockets-rails' # The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'stimulus-rails' # Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'turbo-rails' # Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]

gem 'activerecord-import'
gem 'bootsnap', require: false # Reduces boot times through caching; required in config/boot.rb
gem 'bootstrap'
gem 'connection_pool'
gem 'dry-container'
gem 'faraday-retry'
gem 'pg'
gem 'redis', '~> 4.0' # Use Redis adapter to run Action Cable in production
gem 'sentry-rails'
gem 'sentry-ruby'
gem 'sidekiq'
gem 'sidekiq-cron'
gem 'simple_form'
gem 'slim-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem

group :development, :test do
  gem 'annotate' # Adds model attributes/routes to top of model files/routes file
  gem 'debug', platforms: %i[mri mingw x64_mingw] # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'html2slim', github: 'slim-template/html2slim'
  gem 'i18n-tasks', require: false
  gem 'rspec', require: false
  gem 'rubocop', require: false
  gem 'rubocop-capybara', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rake', require: false
  gem 'rubocop-rspec', require: false
  gem 'rubocop-slim', require: false
  gem 'slim_lint', require: false
end

group :development do
  gem 'web-console' # Use console on exceptions pages [https://github.com/rails/web-console]
end

group :test do
  gem 'capybara' # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'rspec-rails', '~> 3.6.0'
  gem 'selenium-webdriver'
  gem 'simplecov', require: false
  gem 'webdrivers'
  gem 'webmock'
end
