# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"

puts "Creating restaurants"
    3.times do
        file = URI.open("https://i.picsum.photos/id/#{rand(1000)}/200/300")
        restaurant = Restaurant.new(
            name: Faker::Restaurant.name,
            address: Faker::Address.street_address,
            description: Faker::Restaurant.description,
            cuisine: Faker::Nation.nationality,
            user_id: 1
        )
        restaurant.display_photo.attach(io: file, filename: 'file.jpeg', content_type: "image/jpeg")
        restaurant.save
    end
puts "Finished creating restaurants"

puts "Creating restaurant reviews"
    10.times do
        review = Review.new(
            restaurant_id: rand(4),
            user_id: 1,
            comment: Faker::Restaurant.review,
            rating: rand(6)
        )
        review.save
    end
puts "Finished creating restaurant reviews"