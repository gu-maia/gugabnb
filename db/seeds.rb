# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Creating random users with listings, pricing models, rooms, beds etc.

10.times do |i|
  u = User.create!(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: Faker::Internet.password(min_length: 8))

  rand(1..3).times do |i|
    l = Listing.create!(user_id: u.id, short_description: Faker::Lorem.sentence(word_count: rand(3..7)), long_description: Faker::Lorem.sentence(word_count: rand(15..25)), status: [:draft, :archived].sample, guests: rand(1..10), city: Faker::Address.city, state: Faker::Address.state, postal_code: Faker::Number.number(digits: 5), country: "US", lat: Faker::Address.latitude, lng: Faker::Address.longitude, address_line1: Faker::Address.street_address, address_line2: Faker::Address.secondary_address)

    p = Pricing.create!(listing_id: l.id, value: Faker::Number.number(digits:3), cleaning_fee: Faker::Number.number(digits: 2), status: :active) 

    rand(1..10).times do |i|
      return if !User.any?
      
      #Users can review their own listing for now, must be changed 

      reviews = Review.create!(listing_id: l.id, guest_id: User.all.sample.id, stars: rand(1..5), title: Faker::Lorem.paragraph_by_chars(number: rand(10..45), supplemental: false), description: Faker::Lorem.paragraph_by_chars(number: rand(50..250), supplemental: false))
    end

    rand(1..3).times do |i|
      r = Room.create!(listing_id: l.id, room_type: Room.room_types.keys.sample)
      
      rand(1..3).times do |i|
        Bed.create!(room_id: r.id, bed_size: Bed.bed_sizes.keys.sample)
      end
    end
  end
end

# Creating development account 1 and 2

10.times do |i|
  u = User.create!(email: "dev+#{i}@dev.com" , first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: "password")

  rand(1..3).times do |i|
    l = Listing.create!(user_id: u.id, short_description: Faker::Lorem.sentence(word_count: rand(3..7)), long_description: Faker::Lorem.sentence(word_count: rand(15..25)), status: [:draft, :archived].sample, guests: rand(1..10), city: Faker::Address.city, state: Faker::Address.state, postal_code: Faker::Number.number(digits: 5), country: "US", lat: Faker::Address.latitude, lng: Faker::Address.longitude, address_line1: Faker::Address.street_address, address_line2: Faker::Address.secondary_address)

    p = Pricing.create!(listing_id: l.id, value: Faker::Number.number(digits:3), cleaning_fee: Faker::Number.number(digits: 2), status: :active) 

    rand(1..10).times do |i|
      return if !User.any?
      
      #Users can review their own listing for now, must be changed 

      reviews = Review.create!(listing_id: l.id, guest_id: User.all.sample.id, stars: rand(1..5), title: Faker::Lorem.paragraph_by_chars(number: rand(10..45), supplemental: false), description: Faker::Lorem.paragraph_by_chars(number: rand(50..250), supplemental: false))
    end

    rand(1..3).times do |i|
      r = Room.create!(listing_id: l.id, room_type: Room.room_types.keys.sample)
      
      rand(1..3).times do |i|
        Bed.create!(room_id: r.id, bed_size: Bed.bed_sizes.keys.sample)
      end
    end
  end
end



