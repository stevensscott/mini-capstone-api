class ProductsController < ApplicationController
  def index
    pp current_user
    products= Product.all
    render json: products, :include => [:supplier,:images], :methods=>[:is_discounted?] #the :supplier here is what enables us to use the 
    #supplier model
    pp current_user
  end

  def show
    product= params[:id]
    product= Product.find_by(id: product)
    render json: product, :include => [:supplier,:images]
  end

  #
  def create
   
    product=Product.new(
      name: params[:name],
      price: params[:price],    
      description: params[:description],
      supplier_id: params[:supplier_id],
    
    )
    if product.save
      #url: and product_id: are the db cols, the params are just variable names
      image=Image.new(
        url:params[:url],
        product_id:product.id
      
      )
      image.save
      render json: product, :include => [:supplier,:images]
      pp current_user
      
     else
       render json: {message:product.errors.full_messages} ,status:422
    end
  end

  def update
    product_id=params[:id]
    product=Product.find_by(id: product_id)
    product.update(
      name: params[:name] || product.name,
      price: params[:price] || product.price,
      supplier_id: params[:supplier_id] || product.supplier_id,
      description: params[:description] || product.description
    )
    if product.valid?
     
      #render json: product, :include => [:supplier,:images]
      render json: product.as_json
    else
      render json: {message:product.errors.full_messages}, status:422
    end
  end

  def destroy
    product_id=params[:id]
    product=Product.find_by(id: product_id)
    product.destroy
    render json: {message: "#{product.name} with an ID of  #{product_id} was deleted from DB"}
    return "item deleted"
  end
end
