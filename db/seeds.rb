# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Model name:string price:integer image_url:string description:string
puts "DB Seeding started!"
Product.create(name:"pizza", price: 10, image_url:"www.testfornow.com", description: "cheese")
puts "DB Seeding completed!"