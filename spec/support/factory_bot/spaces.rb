FactoryBot.define do
 factory :space, class: Space do
  name { Faker::Company.unique.name }
  email { Faker::Internet.unique.email }
  cnes { Faker::Number.number(7) }
  address { Faker::Address.unique.street_name }
  phones do
   Faker::Config.locale = 'pt-BR'

   entries = Array.new(Faker::Number.between(1, 3))
   entries.map { Faker::PhoneNumber.unique.phone_number }
  end
 end
end
