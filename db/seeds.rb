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
  username: "Sean",
  password: "sean",
  point: 30,
)
User.create(
  username: "Katie",
  password: "katie",
  point: 30,
)
User.create(
  username: "Jenna",
  password: "jenna",
  point: 30,
)
User.create(
  username: "Michelle",
  password: "michelle",
  point: 50,
)
User.create(
  username: "David",
  password: "david",
  point: 55,
)
User.create(
  username: "Isaac",
  password: "isaac",
  point: 55,
)
User.create(
  username: "Corey",
  password: "corey",
  point: 45,
)
User.create(
  username: "Itche",
  password: "itche",
  point: 35,
)
User.create(
  username: "Nicholas",
  password: "nicholas",
  point: 25,
)
User.create(
  username: "Yosef",
  password: "yosef",
  point: 15,
)

puts "Done creating seeds ✅"
