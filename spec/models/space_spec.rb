require 'rails_helper'

RSpec.describe Space, type: :model do
	context 'presence' do
		it 'is valid with valid attributes' do
			expect(FactoryBot.build(:space)).to be_valid
		end
		it 'is not valid without a name' do
			expect(FactoryBot.build(:space, name: nil)).not_to be_valid
		end
		it 'is not valid without an email' do
			expect(FactoryBot.build(:space, email: nil)).not_to be_valid
		end
		it 'is not valid without a cnes' do
			expect(FactoryBot.build(:space, cnes: nil)).not_to be_valid
		end
		it 'is not valid without a phones' do
			expect(FactoryBot.build(:space, phones: [])).not_to be_valid
		end
	end

	context 'uniqueness' do
		it 'is valid with distinct phone numbers' do
			expect(FactoryBot.build(:space, phones: %w[0143211234 01156781243])).to be_valid
		end
		it 'is not valid with same name under same cnes' do
			FactoryBot.create(:space, name: 'SpaceA', cnes: 123_098_45)
			space_b = FactoryBot.build(:space, name: 'SpaceA', cnes: 123_098_45)

			expect(space_b).not_to be_valid
		end
		it 'is not valid with 2 same phone numbers in the same entry' do
			space = FactoryBot.build(:space, phones: %w[0143211234 0143211234])
			expect(space).not_to be_valid
		end
		it 'is not valid with phone number that already exists in a saved entry' do
			space = FactoryBot.create(:space, phones: ['01943218765'])
			space.phones << '01943218765'

			expect(space).not_to be_valid
		end
	end
end
