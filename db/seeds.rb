# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Restaurant.destroy_all

CATEGORY = ["chinese", "italian", "japanese", "french", "belgian"]

5.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    category: CATEGORY.sample
  )

  2.times do
    Review.create!(
      rating: rand(0..5),
      content: Faker::Lorem.paragraphs,
      restaurant: restaurant
    )
  end
end
