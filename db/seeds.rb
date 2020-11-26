# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"
require "open-uri"

Booking.destroy_all
Instrument.destroy_all
User.destroy_all
Category.destroy_all

user = User.new(
 email: 'mees@barthen.com',
 password: '12345678',
 first_name: "Mees",
 last_name: "Barthen",
 address: "1223AB"
 )
user.save!
print "user printed #{user}"

categories = ["Keyboard family", "String family", "Percussion family", "Woodwind family", "Drum family"]
ADDRESSES = ["Burggasse 28, 1070 Vienna", "Schottenfeldgasse 9, 1070 Vienna", "Burgring 1, 1010 Vienna", "Schönbrunner Straße 110, 1050 Vienna", "Pilgramgasse 10, 1050 Vienna", "Schaeffergasse 13, 1040 Vienna", "Schwarzenbergplatz 1, 1010 Vienna", "Franz-Josefs-Kai, 1010 Vienna", "Taborstraße 5, 1020 Vienna"]

pictures = ["https://images.unsplash.com/photo-1520523839897-bd0b52f945a0?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8cGlhbm98ZW58MHx8MHw%3D&auto=format&fit=crop&w=400&q=60",
  "https://images.unsplash.com/photo-1459305272254-33a7d593a851?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
  "https://images.unsplash.com/photo-1595069906974-f8ae7ffc3e7a?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTV8fHBlcmN1c3Npb258ZW58MHx8MHw%3D&auto=format&fit=crop&w=400&q=60",
  "https://images.unsplash.com/photo-1445985543470-41fba5c3144a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
  "https://images.unsplash.com/photo-1519892300165-cb5542fb47c7?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"]

  p categories

  categories.map!.with_index do |category, index|
    file = URI.open(pictures[index])
    category = Category.create(name: category)
    category.photo.attach(io: file, filename: "#{category}.png", content_type: 'image/png')
    category
  end

  puts "#{Category.count} categories created!"


  3.times do

    instrument = Instrument.new(
      name: Faker::Music.instrument,
      description: Faker::Movie.quote,
      address: ADDRESSES.sample,
      price: rand(20..80),
      availability: true,
      user: user,
      category: categories.sample
      )
    instrument.save!
    5.times do
      file = URI.open('https://source.unsplash.com/collection/415470')
      instrument.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    end
  end

  puts "#{Instrument.count} instruments created!"




