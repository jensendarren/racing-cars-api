FactoryBot.define do
  factory :track do
    name { Faker::Name.name }
    surface_type { ['snow', 'gravel', 'asphelt'].sample }
    country { Faker::Address.country }
  end
end