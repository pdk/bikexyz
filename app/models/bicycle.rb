class Bicycle < ActiveRecord::Base
  has_paper_trail
  
  attr_accessible :city, :color, :country, :gears, :lookup_code, :make, :model, :owner_alternate_name, :owner_name, :serial, :size, :state, :type

  # weird hack so that we can have a column named "type".
  self.inheritance_column = :_type_disabled

  validates_presence_of :owner_name, :make, :type, :city, :country
  
  has_many :user_bicycles
  has_many :users, :through => :user_bicycle
  
  before_create :set_lookup_code
  def set_lookup_code
    self.lookup_code = LookupCode.create!.val   
  end


end
