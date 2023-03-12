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
  
  belongs_to :supplier  
  has_many :images
   
  def is_discounted?
    price <= 10   #evaluates to true or false so no need for if conditional
  end

  def tax
    tax= price * 0.09
    return tax
  end

  def total 
    return price + tax
  end
end
