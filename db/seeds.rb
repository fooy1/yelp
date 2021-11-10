# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# TODO: Write a seed to insert 100 posts in the database
puts 'Creating 5 fake restaurants...'
CATEGORIES = %w(italian chinese japanese french belgian)
Restaurant.destroy_all
5.times do
  restaurants = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: CATEGORIES.sample
  )

  restaurants.save!
end
puts 'Finished!'

puts 'Creating 3 fake reviews...'
15.times do
  reviews = Review.new(
    content: Faker::Restaurant.review,
    rating: [0, 1, 2, 3, 4, 5].sample,
    restaurant: Restaurant.all.sample
  )
  reviews.save!
end
puts 'Finished!'
