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



end
