require 'rails_helper'

RSpec.describe Address, type: :model do
	context 'presence' do
		it 'is valid with valid attributes' do
			expect(FactoryBot.build(:address)).to be_valid
		end
		it 'is not valid without a street' do
			expect(FactoryBot.build(:address, street: nil)).not_to be_valid
		end
		it 'is not valid without a number' do
			expect(FactoryBot.build(:address, number: nil)).not_to be_valid
		end
		it 'is not valid without a postal_code' do
			expect(FactoryBot.build(:address, postal_code: nil)).not_to be_valid
		end
		it 'is not valid without a neighborhood' do
			expect(FactoryBot.build(:address, neighborhood: nil)).not_to be_valid
		end
		it 'is not valid without a city' do
			expect(FactoryBot.build(:address, city: nil)).not_to be_valid
		end
		it 'is not valid without a state' do
			expect(FactoryBot.build(:address, state: nil)).not_to be_valid
		end
	end
	context 'uniqueness' do
		it 'is valid with distinct addresses' do
			FactoryBot.create(:address)
			expect(FactoryBot.build(:address)).to be_valid
		end
		it 'is not valid 2 spaces with same address' do
			space = FactoryBot.create(:address)
			space2 = FactoryBot.build(:address, street: space.street, postal_code: space.postal_code, number: space.number, neighborhood: space.neighborhood, city: space.city, state: space.state)

			expect(space2).not_to be_valid
		end
	end
end
