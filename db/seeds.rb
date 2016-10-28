# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Charlie", apartment_id: 1, chorescore: 8)
User.create(name: "Guest User", apartment_id: 1, chorescore: 10)
User.create(name: "Tom", apartment_id: 1, chorescore: 10)
Apartment.create(address: "Test Address", city: "Boston", state: "MA", zip_code: "02139")
