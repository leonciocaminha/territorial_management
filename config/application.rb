require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TerritorialManagement
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller

    # Use the responders controller from the responders gem
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.app_generators.scaffold_controller :responders_controller
    config.encoding = "utf-8"
    config.autoload_paths << Rails.root.join("lib")
    config.time_zone = "America/Fortaleza"
    config.i18n.default_locale = :"pt-BR"
    config.i18n.available_locales = %w(pt-BR en)
    config.active_record.raise_in_transactional_callbacks = true
    config.middleware.use I18n::JS::Middleware
  end
end
