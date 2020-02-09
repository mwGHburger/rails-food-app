# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"

puts 'Assembling users...'
    user = User.new(
        email:        'user@user.com',
        password:     123456,
        remote_photo_url: "https://wallpapersite.com/images/pages/pic_h/17332.png"
    )
    user.save!
puts 'Finished assembling users'

puts "Creating restaurants"
    6.times do
        restaurant = Restaurant.new(
            name: Faker::Restaurant.name,
            address: Faker::Address.street_address,
            description: Faker::Restaurant.description,
            cuisine: Faker::Restaurant.type,
            website: "https://ellamelbourne.com.au/",
            pricing: ["A Cheap Eat", " Moderately Price", "Expensive"].sample,
            user_id: 1,
            remote_photo_url: ["https://images.unsplash.com/photo-1555396273-367ea4eb4db5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1567&q=80","https://images.unsplash.com/photo-1502301103665-0b95cc738daf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80","https://images.unsplash.com/photo-1552566626-52f8b828add9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80","https://images.unsplash.com/photo-1549488344-1f9b8d2bd1f3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80","https://images.unsplash.com/photo-1498654896293-37aacf113fd9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"].sample
        )
        # rand(3).times do
        #     photo_file = URI.open("https://i.picsum.photos/id/800/200/300.jpg")
        #     restaurant.photos.attach(io: photo_file, filename: 'file.jpeg', content_type: "image/jpeg")
        # end
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