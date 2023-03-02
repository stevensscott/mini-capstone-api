Rails.application.routes.draw do
 
  get "/products" => "products#index" #displays all products
  get "/products/:id" => "products#show" #displays single product by passing in product id variable from url
  post "/products" => "products#create" #creates a product and adds to db

end
