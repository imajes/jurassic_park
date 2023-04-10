require_relative "boot"

require "rails" # Pick the frameworks you want:

%w(
  active_record/railtie
  action_controller/railtie
  action_view/railtie
).each do |railtie|
  begin
    require railtie
  rescue LoadError
  end
end



  # active_storage/engine
  # action_mailer/railtie
  # active_job/railtie
  # action_cable/engine
  # action_mailbox/engine
  # action_text/engine


# require "active_model/railtie"
# require "sprockets/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module JurassicPark
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
