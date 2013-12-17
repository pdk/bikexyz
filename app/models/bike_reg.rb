class BikeReg < ActiveRecord::Base
  attr_accessible :xyz_code, :alternate_name, :brand, :cell_phone_one, :cell_phone_two, :city, :color, :country, :kind, :model, :name, :notes, :number_of_gears, :primary_email, :second_email, :serial_number, :size, :state, :third_email
  
  validates_presence_of :xyz_code, :color, :name, :country, :primary_email
  
  has_paper_trail
  
  @@secure_fields = [:primary_email, :second_email, :third_email, :cell_phone_one, :cell_phone_two]
  
  def as_xml(options={})
    options[:except] ||= @@secure_fields
    super(options)
  end

  # Exclude password info from json output.
  def as_json(options={})
    options[:except] ||= @@secure_fields
    super(options)
  end
  
end
