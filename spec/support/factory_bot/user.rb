FactoryBot.define do
	factory :user, class: User do
		name { Faker::Name.name }
		email { Faker::Internet.unique.email }
		gender { Faker::Gender.binary_type.downcase.to_sym }
		type { %i[employee user][Faker::Number.between(0, 1)] }
		cpf { Faker::IDNumber.unique.valid }

		phones do
			entries = Array.new(Faker::Number.between(1, 3))
			entries.map { Faker::PhoneNumber.unique.phone_number }
		end
	end
end
