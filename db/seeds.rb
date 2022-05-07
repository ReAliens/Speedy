# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


user1 = User.create(name: "user1")

item1 = Item.create(name: "item1", user_id: user1.id, photo: "http/photo.com", description: "description1", specs: "specs1", price: "12")

reserveds1 = Reserved.create(name: "reserved1", user_id: user1.id, item_id: item1.id, city: "city1", started_at: "2020-04-29", ended_at: "2020-04-29")