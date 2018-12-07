require 'simplecov'
require 'simplecov-console'
require File.expand_path('../lib/simple_cov/formatter/shield', __FILE__)

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new [
	SimpleCov::Formatter::HTMLFormatter,
	SimpleCov::Formatter::Console
]

SimpleCov.minimum_coverage 90
SimpleCov::Formatter::Shield.options[:style][:value] = :big
SimpleCov::Formatter::Shield.options[:coverage][:high] = SimpleCov.minimum_coverage

RSpec.configure do |config|
	if config.files_to_run.one?
		config.formatter = :documentation
	else
		SimpleCov.start 'rails' do
			add_filter 'app/channels/application_cable/channel.rb'
			add_filter 'app/channels/application_cable/connection.rb'
			add_filter 'app/jobs/application_job.rb'
			add_filter 'app/mailers/application_mailer.rb'
			add_filter 'app/controllers/application_controller.rb'
			add_filter 'app/helpers/application_helper.rb'
			add_filter 'lib/simple_cov/formatter/shield.rb'

			add_group 'Services', 'app/services'

			add_group 'Models' do |src|
				(
					src.filename.include?('app/models') &&
					!src.filename.include?('app/models/database') &&
					!src.filename.include?('app/models/concerns')
				)
			end
			add_group 'Database Models' do |src|
				(
					src.filename.include?('app/models') ||
					src.filename.include?('app/models/concerns')
				)
			end
		end
	end
end
