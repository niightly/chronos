FactoryBot.define do
	factory :space, class: Space do
		name { Faker::Company.unique.name }
		email { Faker::Internet.unique.email }
		cnes { Faker::Number.number(7) }

		phones do
			entries = Array.new(Faker::Number.between(1, 3))
			entries.map { Faker::PhoneNumber.unique.phone_number }
		end

		address { association(:address) }
	end
end
