# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Car.create([{car_slug: 'nissan_datsun', max_speed: 255},
            {car_slug: 'subaru_impreza', max_speed: 280},
            {car_slug: 'tesla_model_s', max_speed: 380},
            {car_slug: 'lamborghini_aventador', max_speed: 365}])