class Order < ActiveRecord::Base
  attr_accessible :email, :address, :city, :name, :order_type_id, :state, :zip, :stripe_card_token

  belongs_to :order_type

end
