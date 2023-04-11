# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.1"

## CORE, RAILS
gem 'bootsnap', require: false
gem "rails", "~> 7.0.4", ">= 7.0.4.3"

## CORE, DATABASE
# gem 'pg'
gem "sqlite3" # for this test, though normally, PG

## CORE, REDIS/FAST DB
# gem "hiredis"
# gem "redis"
# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

## CORE, DATA STRUCTURES
# gem 'acts_as_list'
# gem 'paper_trail'
# gem 'paranoia'

## CORE, ASYNC
# gem 'sidekiq'

## CORE, USER AUTH
# gem 'devise'
# gem 'jwt'
# gem 'strong_password'
# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

## CORE, ACTIVESTORAGE
# gem 'active_storage_validations'
# gem 'aws-sdk-s3', require: false
# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

## CORE, MIDDLEWARE
# gem 'rack-canonical-host'
# gem 'rack-cors'

## CORE, DATA PROCESSING
gem 'oj'

## UI, COMPONENTS
# gem 'view_component'
# gem 'will_paginate'

# UI, RENDERING
# gem 'humanize'
# gem 'rich_text_renderer'

# UI, LIBRARIES/RAILTIES
# gem 'autoprefixer-rails'
# gem 'bootstrap', '~> 4.4.1'
# gem 'font-awesome-rails'
# gem 'react-rails'
# gem 'sassc-rails'
# gem 'sprockets', '3.7.2'
# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

## DEPLOYMENT, FRAMING
gem 'puma'

## API, GENERIC
gem 'rest-client'

## DEPLOYMENT, MONITORING
gem 'amazing_print'
gem 'rails_semantic_logger'

group :production do
  gem 'rack-heartbeat'
  gem 'rack-timeout'

  ## CODE PATH TRACING
  gem 'coverband', require: false
end

group :development do
  gem 'better_errors'
  gem 'bundler-audit', require: false
  gem 'derailed_benchmarks'
  gem 'fasterer' # Fasterer will suggest some speed improvements
  gem 'meta_request', require: false
  gem 'rails_best_practices'
  gem 'rails-erd'
  gem 'stackprof'
  gem 'traceroute' # gem for finding dead routes (command is 'rake traceroute')
  gem 'web-console'
end

## SHARED DEPS FOR DEV/TEST
group :development, :test do
  gem 'activerecord-explain-analyze'
  gem 'active_record_query_trace', require: false
  gem 'benchmark-ips'
  gem 'brakeman', require: false
  gem 'bullet'
  gem 'capybara-select-2'
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'factory_bot_rails'
  gem 'fast_stack'
  gem 'i18n-tasks'
  gem 'json-diff' # Compute the difference between two JSON-serializable Ruby objects - https://github.com/espadrine/json-diff
  gem 'letter_opener'
  gem 'letter_opener_web'
  gem 'marginalia'
  gem 'neovim'
  gem 'os'
  gem 'pdf-reader'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'snip_snip'
end

group :test do
  gem 'apparition'
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'climate_control'
  gem 'database_cleaner'
  gem 'faker'
  # gem 'fakeredis', require: false
  gem 'formulaic'
  gem 'fuubar'
  gem 'json_spec'
  gem 'launchy'
  gem 'mock_redis'
  gem 'rack_session_access'
  gem 'rails-controller-testing'
  # gem 'rerun'
  gem 'rspec_junit_formatter'
  gem 'rspec-rails'
  # gem 'rspec-sidekiq'
  # gem 'selenium-webdriver'
  # gem 'simplecov', require: false
  # gem 'simplecov_json_formatter'
  gem 'shoulda-matchers'
  gem 'terminal-table'
  # gem 'timecop'
  # gem 'vcr'
  # gem 'webdrivers'
  gem 'webmock'
end

