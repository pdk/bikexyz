class Bicycle < ActiveRecord::Base
  attr_accessible :city, :color, :country, :gears, :lookup_code, :make, :model, :owner_alternate_name, :owner_name, :serial, :size, :state, :type

  # weird hack so that we can have a column named "type".
  self.inheritance_column = :_type_disabled

  validates_presence_of :owner_name, :make, :type
end
