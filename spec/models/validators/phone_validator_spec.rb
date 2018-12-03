require 'rails_helper'

RSpec.describe PhoneValidator do
	describe '# validate' do
		context 'valid document' do
			subject { FactoryBot.build(:space) }
			it { expect(subject.save).to be_truthy }
		end

		context 'invalid document' do
			it 'should return false if missing phones' do
				doc = FactoryBot.build(:space, phones: [])
				expect(doc.save).not_to be_truthy
			end
			it 'should return false if duplicated phones' do
				doc = FactoryBot.build(:space, phones: %w[0143211234 0143211234])
				expect(doc.save).not_to be_truthy
			end
		end
	end
end
