# encoding: utf-8

class BikeRegPhotoUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave
  
  process :tags => ['bike-reg-photo']
  
  version :large do
    cloudinary_transformation :width => 1000, :height => 800, :crop => :fit
  end
  
  version :medium do
    cloudinary_transformation :width => 500, :height => 500, :crop => :fit
  end
  
  version :small do
    cloudinary_transformation :width => 200, :height => 200, :crop => :fit
  end

  version :small_square do
    cloudinary_transformation :width => 150, :height => 150, :crop => :fill, :gravity => :face
  end

  version :thumb_square do
    cloudinary_transformation :width => 75, :height => 75, :crop => :fill, :gravity => :face
  end

end
