# frozen_string_literal: false

ENV['RACK_ENV'] = 'test'

require File.expand_path('../config/environment', __dir__)
abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'rspec/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |file| require file }

RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
  config.include ActiveSupport::Testing::TimeHelpers

  config.before(:suite) do
    Rails.application.load_tasks
  end
end

ActiveRecord::Migration.maintain_test_schema!
