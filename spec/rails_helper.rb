ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f unless f.include?('stubs') }
Dir[Rails.root.join('spec/support/stubs/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
	config.infer_spec_type_from_file_location!
	config.filter_rails_from_backtrace!
	config.render_views = true

	to_include = Dir.entries('spec/support/helpers/').select { |entry| entry.ends_with?('.rb') }
	to_include.each do |filename|
		filename = filename.split('.').first
		class_name = "Helpers::#{filename.capitalize}"

		if filename.include?('_')
			class_name = filename.split('_')
			class_name = class_name.collect(&:capitalize)
			class_name = "Helpers::#{class_name.join('')}"
		end

		config.include class_name.to_s.safe_constantize
	end
end
