require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Chronos
	class Application < Rails::Application
		# Initialize configuration defaults for originally generated Rails version.
		config.load_defaults 5.2

		config.active_job.queue_adapter = :sidekiq

		config.autoload_paths << Rails.root.join('app', 'models', 'validators').to_s
		config.autoload_paths << "#{Rails.root}/lib"
		config.eager_load_paths << "#{Rails.root}/lib"

		config.generators do |generator|
			generator.stylesheets = false
			generator.javascripts = false
			generator.helper = false

			generator.fixture_replacement :factory_bot, dir: 'spec/support/factory_bot/'
		end
	end
end
