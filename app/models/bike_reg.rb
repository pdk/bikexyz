class BikeReg < ActiveRecord::Base
  attr_accessible :xyz_code, :alternate_name, :brand, :cell_phone_one, :cell_phone_two, :city, :color, :country, :kind, :model, :name, :notes, :number_of_gears, :primary_email, :second_email, :serial_number, :size, :state, :third_email, :photo_1, :photo_2, :photo_3, :photo_4, :photo_5, :photo_6, :photo_1_cache, :photo_2_cache, :photo_3_cache, :photo_4_cache, :photo_5_cache, :photo_6_cache, :year
  
  validates_presence_of :xyz_code, :color, :name, :country, :primary_email
  
  has_paper_trail

  mount_uploader :photo_1, BikeRegPhotoUploader
  mount_uploader :photo_2, BikeRegPhotoUploader
  mount_uploader :photo_3, BikeRegPhotoUploader
  mount_uploader :photo_4, BikeRegPhotoUploader
  mount_uploader :photo_5, BikeRegPhotoUploader
  mount_uploader :photo_6, BikeRegPhotoUploader

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

  def authorized?(email)
    if email.blank?
      return false
    end
    
    [primary_email.downcase, second_email.downcase, third_email.downcase].include? email.downcase
  end
end
