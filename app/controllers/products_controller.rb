class ProductsController < ApplicationController
  def all_products
    products= Product.all
    render json: products.as_json
  end

  def product_by_name
    product= Product.find_by(name: "hot dog")
    render json: product.as_json
  end

end
