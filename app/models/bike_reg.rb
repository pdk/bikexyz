class BikeReg < ActiveRecord::Base
  attr_accessible :xyz_code, :alternate_name, :brand, :cell_phone_one, :cell_phone_two, :city, :color, :country, :kind, :model, :name, :notes, :number_of_gears, :primary_email, :second_email, :serial_number, :size, :state, :third_email
  
  validates_presence_of :xyz_code, :color, :name, :country, :primary_email
  
  has_paper_trail
end
