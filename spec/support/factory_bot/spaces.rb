FactoryBot.define do
	factory :space, class: Space do
		name { Faker::Company.unique.name }
		email { Faker::Internet.unique.email }
		cnes { Faker::Number.number(7) }

		phones do
			entries = Array.new(Faker::Number.between(1, 3))
			entries.map { Faker::PhoneNumber.unique.phone_number }
		end

		street { "#{Faker::Address.street_suffix} #{Faker::Address.street_name}" }
		number { Faker::Address.building_number }
		postal_code { Faker::Address.zip_code }
		complement { Faker::Address.secondary_address }
		neighborhood { Faker::Address.community }
		state { Faker::Address.state_abbr }
		city { Faker::Address.city }
	end
end
