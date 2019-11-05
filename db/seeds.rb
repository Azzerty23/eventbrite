# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# Détruire ta base actuelle
# Créer 20 utilisateurs
# Créer 10 villes
# Créer 50 listings
# Pour chaque listing
# Créer 5 réservations dans le passé
# Créer 5 réservations dans le futur

User.destroy_all
Event.destroy_all
Attendance.destroy_all

user_array = []
event_array = []

# Faker::Config.locale = 'fr-FR'

20.times do |i|
  u = User.create!( 
    email: Faker::Internet.email, 
    password: Faker::Internet.password(min_length: 8, max_length: 16, mix_case: true, special_characters: false),
    description: Faker::Lorem.sentence(word_count: 50, supplemental: false, random_words_to_add: 4),
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name
  )
  user_array << u
  end

tp User.all
# pp user_array

puts "Users created"

10.times do
  e = Event.create!(
    start_date: Faker::Date.between(from: 1.day.from_now, to: 6.month.from_now),
    duration: 5 * rand(1..72),
    title: Faker::Superhero.name,
    description: Faker::ChuckNorris.fact,
    price: rand(1..1000),
    location: Faker::Address.city,
    administrator: user_array.sample
    )
  event_array << e
  end

puts "Events created"

event_array.each do |event|
  5.times do
    Attendance.create!(
      event: event,
      user: user_array.sample,
      stripe_customer_id: nil
    )
    end
  end

puts "Attendances created"