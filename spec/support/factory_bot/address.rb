FactoryBot.define do
	factory :address, class: Address do
		street { "#{Faker::Address.street_suffix} #{Faker::Address.street_name}" }
		number { Faker::Address.building_number }
		postal_code { Faker::Address.zip_code }
		complement { Faker::Address.secondary_address }
		neighborhood { Faker::Address.community }
		state { Faker::Address.state_abbr }
		city { Faker::Address.city }
	end
end
