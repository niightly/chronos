require 'factory_bot_rails'
require 'webmock/rspec'
require 'simplecov'

RSpec.configure do |config|
	config.fail_fast = true

	config.expect_with :rspec do |expectations|
		expectations.include_chain_clauses_in_custom_matcher_descriptions = true
	end

	config.mock_with :rspec do |mocks|
		mocks.verify_partial_doubles = true
	end

	config.shared_context_metadata_behavior = :apply_to_host_groups

	config.before :each do
		DatabaseCleaner.strategy = :truncation
		DatabaseCleaner.start

		stub_request(:any, %r{https://img.shields.io}).to_rack(ShieldIoStub)
	end

	config.after { DatabaseCleaner.clean }

	config.include FactoryBot::Syntax::Methods
	FactoryBot.definition_file_paths = ['spec/support/factory_bot']
	FactoryBot.factories.clear
	config.before(:suite) { FactoryBot.find_definitions }
end
