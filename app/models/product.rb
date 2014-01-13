class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :stock, :product_type_id
  
  has_paper_trail

  belongs_to :product_type
  has_many :order_products
end
