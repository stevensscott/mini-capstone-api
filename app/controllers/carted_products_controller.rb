class CartedProductsController < ApplicationController
  # t.integer "user_id"
  # t.integer "product_id"
  # t.integer "quantity"
  # t.integer "order_id"

  def create
   
    carted_product=CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],    
      quantity: params[:quantity],
      order_id: nil,
      status: "carted"
    
    )
    if carted_product.save    
    
      render json: carted_product.as_json
      pp current_user
      
     else
       render json: {message:carted_product.errors.full_messages} ,status:422
    end
  end

  def index
    carted_products=CartedProduct.all

    
    render json: carted_products.as_json
    
   
  end
  
end




