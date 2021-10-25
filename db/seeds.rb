# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Deleting seeds! 🗑"
User.destroy_all

puts "Creating seeds! 🌸"
User.create(
  username: "S",
  password: "S",
  points: 30,
)
User.create(
  username: "K",
  password: "K",
  points: 30,
)
User.create(
  username: "J",
  password: "J",
  points: 30,
)
User.create(
  username: "Michelle",
  password: "michelle",
  points: 50,
)
User.create(
  username: "David",
  password: "david",
  points: 55,
)
User.create(
  username: "Isaac",
  password: "isaac",
  points: 55,
)
User.create(
  username: "Corey",
  password: "corey",
  points: 45,
)
User.create(
  username: "Itche",
  password: "itche",
  points: 35,
)
User.create(
  username: "Nicholas",
  password: "nicholas",
  points: 25,
)
User.create(
  username: "Yosef",
  password: "yosef",
  points: 15,
)

puts "Done creating seeds ✅"
