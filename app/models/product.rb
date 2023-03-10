class Product < ApplicationRecord
  #Name - presence - uniqueness
  validates  :name, presence: true
  validates  :name, uniqueness: true
  #Price - presence - numericality and not a negative number or 0
  validates  :price, presence: true
  validates  :price, numericality: {greater_than:0}
 
  #Description - length of a minimum of 10 and a maximum of 500 characters
  validates  :description, length: {in:10..500 }
  validates  :description, presence: true
  
  def supplier
    Supplier.find_by(id: supplier_id) 
  end
  def images
    #product_id is the col name in image table
    #id is the id of the product table
    Image.where(product_id: id )
  end
end
