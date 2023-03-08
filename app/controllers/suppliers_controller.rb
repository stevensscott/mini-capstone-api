class SuppliersController < ApplicationController

  def index
    suppliers= Supplier.all
    render json: suppliers.as_json
  end

  def show
    supplier_id= params[:id]
    supplier= Supplier.find_by(id: supplier_id)
    render json: supplier.as_json
  end

  def create
    supplier=Supplier.new(
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number]
      
    )
    if supplier.save
      render json: supplier.as_json
     else
       render json: {message:supplier.errors.full_messages} ,status:422
    end
  end

  # def update <-WORKING HERE
  #   supplier_id=params[:id]
  #   supplier=Supplier.find_by(id:supplier_id)
  #   supplier.update{
  #     name: params[:name] || supplier.name,



  #   }
  # end


end
