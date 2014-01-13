class Order < ActiveRecord::Base
  attr_accessible :email, :address, :city, :name, :state, :zip, :stripe_card_token

  has_paper_trail
  
  has_many :order_products
end
