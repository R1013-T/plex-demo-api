require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.time_zore = ENV["TZ"] || "Asia/Tokyo"

    config.active_record.default_timezone = :utc

    config.api_only = true
  end
end
