class OrdersController < ApplicationController

  def index
    # orders=Order.all
    # if current_user
    #   render json: current_user.orders.as_json
    # else
    #   render json: {message: "Must be current user to see the orders"}
    # end
    @orders = current_user.orders
    render template: "orders/index"


  end
  
  
  
  def create
    product=Product.find_by(id: params[:product_id])
    prod_tax=product.price * 0.07
    prod_total=product.price + prod_tax
    order=Order.new(
    user_id:current_user.id,
    product_id: params[:product_id],
    quantity: params[:quantity],
    subtotal: product.price,
    tax: prod_tax,
    total: prod_total)
    if order.save
      render json: order.as_json
    
    else
      render json: {message:order.errors.full_messages}, status:422
    end
  end

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
