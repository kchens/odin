# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Airport.delete_all
Airport.create(:codename => "SFO")
Airport.create(:codename => "WAS")
Airport.create(:codename => "BWI")
Airport.create(:codename => "PVD")


Flight.delete_all
Flight.create(from_airport_id: "1", to_airport_id: "2", departure_date: Time.now, duration: "10")
Flight.create(from_airport_id: "3", to_airport_id: "4", departure_date: Time.now, duration: "5")
Flight.create(from_airport_id: "2", to_airport_id: "1", departure_date: Time.now+3, duration: "10")
Flight.create(from_airport_id: "4", to_airport_id: "3", departure_date: Time.now+3, duration: "5")