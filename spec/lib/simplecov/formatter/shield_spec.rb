require 'rails_helper'

RSpec.describe SimpleCov::Formatter::Shield do
	describe '#options' do
		it 'should options match schema "SimpleCovFormatterShieldSchema"' do
			expect(described_class.options.to_json).to response_match_schema('SimpleCovFormatterShieldSchema', json: true)
		end
	end
end
