require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Speedy
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
<<<<<<< HEAD
<<<<<<< HEAD
=======
    # config.factory_bot.definition_file_paths = ["custom/factories"]
>>>>>>> a9d86bd5ea8877847fca55e89c73b536b5f8270e


    # This also configures session_options for use below
    config.session_store :cookie_store, key: '_interslice_session'

    # Required for all session management (regardless of session_store)
    config.middleware.use ActionDispatch::Cookies

    config.middleware.use config.session_store, config.session_options
<<<<<<< HEAD
=======
    # config.factory_bot.definition_file_paths = ["custom/factories"]
>>>>>>> ae446de83a0b345f59f4b981d3e78b6c80a0aaca
=======
>>>>>>> a9d86bd5ea8877847fca55e89c73b536b5f8270e
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
  end
end
