class OrdersController < ApplicationController
  #Ensures anyone using this controller is authenticated
  #authenticate_user is a method from the application controller
  before_action :authenticate_user 

  #renders all orders from the Order DB(model)
  #the all method is what is used to retrieve all orders
  #if current user limits the rendered results only to the logged in user(jwt)
  def index
    orders=Order.all
    if current_user
      render json: current_user.orders.as_json
    else
      render json: {message: "Must be current user to see the orders"}
    end
    # @orders = current_user.orders
    # render template: "orders/index"


  end
  
  
  #in the create method,we first look up the product that we are adding to the order by product id.
  #Once we have the product, we can use that to calc subtotal,tax, total.
  #We then use this information to create the order
  def create
    product=Product.find_by(id: params[:product_id])
    subtotal= product.price * params[:quantity].to_i
    prod_tax=subtotal * 0.07
    prod_total=subtotal + prod_tax
    @order=Order.new(
    user_id:current_user.id,
    product_id: params[:product_id],
    quantity: params[:quantity],
    subtotal: subtotal,
    tax: prod_tax,
    total: prod_total)
  #if order saves with no errors, render the orders template, which resides in _order.json
    if @order.save
      render template: "orders/show"
  #if order does not save, render stock error message and a 422 which means unprocessable content(ie-something wrong with request)
    else
      render json: {message:@order.errors.full_messages}, status:422
    end
  end
  #in the show method, we are passing in a specific order id
  #we then use the find_by method to look it up in the DB
  #next, follow the same logic as above, we eithe render it from the view
  #or render an error message
  def show
    order_id=params[:id]
    @order=Order.find_by(id: order_id)
    if current_user
      #render json: order.as_json
      render template: "orders/show"
    else
      render json:{message:"Must be current user to view"}
    end

  end
end
