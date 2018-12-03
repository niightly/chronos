require 'rails_helper'

RSpec.describe User, type: :model do
	context 'presence' do
		it 'is valid with valid attributes' do
			expect(FactoryBot.build(:user)).to be_valid
		end
		it 'is not valid when type is not valid' do
			expect(FactoryBot.build(:user, type: :member)).not_to be_valid
		end
		it 'is not valid without name' do
			expect(FactoryBot.build(:user, name: nil)).not_to be_valid
		end
		it 'is not valid without email' do
			expect(FactoryBot.build(:user, email: nil)).not_to be_valid
		end
		it 'is not valid with a invalid email pattern' do
			expect(FactoryBot.build(:user, email: 'xxxx.com.br')).not_to be_valid
		end
		it 'is not valid an employee without cpf' do
			expect(FactoryBot.build(:user, type: :employee, cpf: nil)).not_to be_valid
		end
		it 'is valid an user without cpf' do
			expect(FactoryBot.build(:user, type: :user, cpf: nil)).to be_valid
		end
		it 'is not valid without phones' do
			expect(FactoryBot.build(:user, phones: nil)).not_to be_valid
		end
		it 'is not valid without gender' do
			expect(FactoryBot.build(:user, gender: nil)).not_to be_valid
		end
	end
	context 'uniqueness' do
		it 'is valid with distinct emails' do
			FactoryBot.create(:user, email: 'test1@email.com')
			expect(FactoryBot.build(:user, email: 'test2@email.com')).to be_valid
		end

		it 'is not valid with same emails' do
			FactoryBot.create(:user, email: 'test1@email.com')
			expect(FactoryBot.build(:user, email: 'test1@email.com')).not_to be_valid
		end
	end
end
