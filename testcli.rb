require 'http'
#GET#
# response = HTTP.get('http://localhost:3000/products')
# puts response
#POST-TAKE USER INPUT AND CALL API/SAVE TO DB#
##############################################
# puts "Please enter an item number to update: "
# item=gets.chomp
# puts "Please Enter Product Name: "
# name=gets.chomp
# puts "Please Enter Price: "
# price =gets.chomp
# puts "Please enter url: "
# url=gets.chomp
# puts "Please enter a product description: "
# description=gets.chomp
#############################################
#HTTP.post("http://localhost:3000/products.json", :json => { :name => name, :price => price.to_i, :image_url => url, :description =>description })

# HTTP.patch("http://localhost:3000/products/#{item}.json", :json => { :name => name, :price => price.to_i, :image_url => url, :description =>description })

response=HTTP.delete("http://localhost:3000/products/7.json")
pp response.status

  
  

