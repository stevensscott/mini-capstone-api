Rails.application.routes.draw do
 
  get "/all_products", controller: "products", action: "all_products"
  get "/product_by_name", controller: "products", action: "product_by_name"

end
