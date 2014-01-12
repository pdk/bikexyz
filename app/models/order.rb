class Order < ActiveRecord::Base
  attr_accessible :email, :address, :city, :name, :state, :zip, :stripe_card_token

end
