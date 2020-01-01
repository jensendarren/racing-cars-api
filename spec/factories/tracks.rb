FactoryBot.define do
  factory :track do
    name { Faker::Name.name }
    surface_type { ['snow', 'gravel', 'asphelt'].sample }
    country { Faker::Address.country }
    time_zone { ['Eastern Time (US & Canada)', 'CET', 'Beijing', 'Sydney'].sample }
  end
end