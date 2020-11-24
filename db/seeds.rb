# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"


Instrument.delete_all
User.delete_all

user = User.new(
   email: 'mees@hshss.com',
   password: '12345678',
   first_name: "Mees",
   last_name: "Barthen",
   address: "1223AB"
  )
user.save!

30.times do
    instrument = Instrument.create!(
    name: Faker::Music.instrument,
    category: ["Keyboard family", "Strings family", "Drum family", "Woodwind family", "Percussion family"].sample,
    description: Faker::Movie.quote,
    address: Faker::Address.street_address,
    price: rand(20..80),
    availability: true,
    user: user
  )
end

categories = ["Keyboard family", "String family", "Percussion family", "Woodwind family", "Drum family"]

categories.each do |category|
  category = Category.create(name:[categories])
end

