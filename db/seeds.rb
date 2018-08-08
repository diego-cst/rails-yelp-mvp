require 'faker'
categories = %w(chinese italian japanese french belgian)
values = [0, 1, 2, 3, 4, 5]

puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants...'
5.times do
  new_restaurant = Restaurant.new(
    name: Faker::Superhero.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber,
    category: categories.sample
    )
  new_restaurant.save
  5.times do
    review = Review.new(
    content: Faker::Hipster.sentence,
    rating: values.sample,
    )
    review.restaurant = new_restaurant
    review.save
  end
end

puts 'Done!'
