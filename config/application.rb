require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ClTemplate
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.eager_load_paths << Rails.root.join("extras")

    
    config.time_zone = "Europe/Madrid"
    
    config.i18n.available_locales = [:es, :en]
    config.i18n.default_locale = :es
    config.i18n.fallbacks = true
    
    Faker::Config.locale = 'es'

    config.generators do |g|
      g.assets            false
      g.helper            false
      g.test_framework    :rspec
      g.jbuilder          false
    end
  end
end
