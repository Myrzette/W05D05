# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

City.destroy_all
10.times do |x|
  city = City.create!(name: Faker::Address.city, zip_code: rand(10000..99999))
  puts "City n°#{x + 1} created"
end

User.destroy_all
20.times do |x|
  user = User.create!(email: Faker::Internet.email, phone_number: "0#{rand(100000000..999999999)}", description: Faker::Company.bs)
  puts "User n°#{x + 1} created"
end

Listing.destroy_all
50.times do |x|
  listing = Listing.create!(available_beds: rand(1..10), price: rand(1..1000), description: Faker::Lorem.characters(number: 150), has_wifi: [true, false].sample, welcome_message: Faker::Lorem.sentence(word_count: 5), city_id: City.all.sample.id, admin_id: User.all.sample.id)
  puts "Listing n°#{x + 1} created"
end

Reservation.destroy_all
Listing.all.each do |x|

  5.times do |y|
    date = Faker::Date.between(from: 1.year.ago, to: Date.today)
    reservation = Reservation.create!(start_date: date, end_date: date + rand(1..10),listing_id: x.id, guest_id: User.all.sample.id)
    puts "Passed reservation n°#{y + 1} created for listing n°#{x.id}"
  end

  5.times do |y|
    date = Faker::Date.between(from: Date.today, to: 1.year.from_now)
    reservation = Reservation.create!(start_date: date, end_date: date + rand(1..10), listing_id: x.id, guest_id: User.all.sample.id)
    puts "Futur reservation n°#{y + 1} created for listing n°#{x.id}"
  end
end
