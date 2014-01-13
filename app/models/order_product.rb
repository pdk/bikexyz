class OrderProduct < ActiveRecord::Base
  attr_accessible :count, :order_id, :product_id, :xyz_code

  has_paper_trail
  
  belongs_to :order
  belongs_to :product
end
