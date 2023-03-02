require 'faker'

#Model name:string price:integer image_url:string description:string
puts "DB Seeding started!"
Product.create(name:"hamburger", price: 10, image_url:"www.testfornow.com", description: "cheese")
Product.create(name:"hot dog", price: 10, image_url:"www.testfornow.com", description: "cheese")
Product.create(name:"salad", price: 10, image_url:"www.testfornow.com", description: "cheese")
Product.create(name:"tacos", price: 10, image_url:"www.testfornow.com", description: "cheese")


Faker::Product.name #=> "blablabla"
faker_name=Faker::Product.name
Product.create(name:faker_name)
puts "DB Seeding completed!"