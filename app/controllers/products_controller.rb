class ProductsController < ApplicationController
  def index
    products= Product.all
    render json: products.as_json
  end

  def show
    product= params[:id]
    product= Product.find_by(id: product)
    render json: product.as_json
  end

  #HARDCODED CREATE
  # def create
  #   product=Product.new(
  #     name:"hardcodedPOSThamburger",
  #     price: 10,
  #     image_url:"www.testfornow.com",
  #     description: "cheese"
  #   )
  #   product.save
  #   render json: product.as_json
  # end

 # Dynamically created product
  def create
    product=Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description]
    )
    product.save
    render json: product.as_json
  end

  def update
    product_id=params[:id]
    product=Product.find_by(id: product_id)
    product.update(
      name: params[:name] || product.name,
      price: params[:price] || product.price,
      image_url: params[:image_url] || product.image_url,
      description: params[:description] || product.description,
    )
    render json: product.as_json
  end

  def destroy
    product_id=params[:id]
    product=Product.find_by(id: product_id)
    product.destroy
    render json: {message: "#{product.name} with an ID of  #{product_id} was deleted from DB"}
    return "item deleted"
  end
end
