# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "fake_user_1@fakemail.com", password: "fakefake")
User.create(email: "fake_user_2@fakemail.com", password: "fakefake")

Flat.create(user_id: 2, title: "Flat in Paris", description: "Nice flat in Paris", address_numberstreet: "1 rue du Cygne", address_zip: 75001, address_city: "Paris",address_country: "France",night_price: 100,capacity: 2)
Flat.create(user_id: 3, title: "Flat in Villejuif", description: "Nice flat in Villejuif", address_numberstreet: "1 rue du Cygne", address_zip: 75001, address_city: "Paris",address_country: "France",night_price: 50,capacity: 1)
