FactoryBot.define do
  factory :car do
    car_slug { Faker::Name.name }
    max_speed { rand(180..420) }
  end
end