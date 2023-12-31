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

    # https://qiita.com/KazuyaInoue/items/2d4065ddf2237c66dfd4
    config.session_store :cookie_store, key: '_interslice_session'
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use config.session_store, config.session_options

    config.api_only = true
  end
end
