FactoryBot.define do
  factory :car do
    car_slug { ['lamborghini_aventador', 'nissan_datsun', 'subaru_impreza', 'tesla_model_s'].sample }
    max_speed { rand(180..420) }
  end
end