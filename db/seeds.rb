# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Apartment.create(address: "Test Address", city: "Boston", state: "MA", zip_code: "02139")
User.create(name: "Guest User", apartment_id: 1, chorescore: 10)
User.create(name: "Charlie", apartment_id: 1, chorescore: 8)
User.create(name: "Roommate 3", apartment_id: 1, chorescore: 10)
User.create(name: "Roommate 4", apartment_id: 1, chorescore: 10)

Chore.create(id: 2, name: "Empty Dishrack", completion_interval: 1, apartment_id: 1, user_id: 4, last_completed: Time.now, due_by: Time.now + 1.days, points: 1)
Chore.create(id: 3, name: "Swiffer Kitchen", completion_interval: 15, apartment_id: 1, user_id: 3, last_completed: Time.now - 7.days, due_by: Time.now + 6.days, points: 3)
Chore.create(id: 5, name: "Clean Toilet", completion_interval: 7, apartment_id: 1, user_id: 2, last_completed: Time.now - 3.days, due_by: Time.now + 4.days, points: 2)
Chore.create(id: 6, name: "Wipe Stovetop", completion_interval: 7, apartment_id: 1, user_id: 4, last_completed: Time.now - 5.days, due_by: Time.now + 2.days, points: 1)
Chore.create(id: 7, name: "Sweep Livingroom", completion_interval: 10, apartment_id: 1, user_id: 2, last_completed: Time.now - 1.days, due_by: Time.now + 9.days, points: 2)
