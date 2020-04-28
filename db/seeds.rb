# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Start seeding'
100.times do |i|
  puts "Creating restaurant #{i}."
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: %w[chinese italian japanese french belgian].sample
  )
  puts "Creating review #{i}."
  review = Review.create(
    content: Faker::Lorem.sentence,
    rating: rand(0..5),
    restaurant: restaurant
  )
  review.restaurant = restaurant
end
puts 'The seeds were planted!'
