class Bicycle < ActiveRecord::Base
  attr_accessible :city, :color, :country, :gears, :lookup_code, :make, :model, :owner_alternate_name, :owner_name, :serial, :size, :state, :type
end
