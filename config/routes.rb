Rails.application.routes.draw do
 #Products
  get "/products" => "products#index" #displays all products
  get "/products/:id" => "products#show" #displays single product by passing in product id variable from url
  post "/products" => "products#create" #creates a product and adds to db
  patch "/products/:id" =>"products#update"#updates a product by ID
  delete "/products/:id" =>"products#destroy"#deletes a product by ID
 #Suppliers
  get "/suppliers" => "suppliers#index" #displays all products
  get "/suppliers/:id" => "suppliers#show" #displays single product by passing in product id variable from url
  post "/suppliers" => "suppliers#create" #creates a product and adds to db
  patch "/suppliers/:id" =>"suppliers#update"#updates a product by ID
  delete "/suppliers/:id" =>"suppliers#destroy"#deletes a product by ID

 #Users
  post "/users" => "users#create" #creates a new user/pw

  #Sessions
  post "/sessions" =>"sessions#create"#creates a new session

  #Orders
  post "/orders" =>"orders#create"#creates a new order
  get "/orders/:id" => "orders#show"#gets an order by id passed in
  get "orders/" =>"orders#index"#get all orders




end
