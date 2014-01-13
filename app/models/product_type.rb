class ProductType < ActiveRecord::Base
  attr_accessible :name
  
  has_paper_trail
  
  has_many :products
end
