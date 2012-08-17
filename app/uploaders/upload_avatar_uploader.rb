# encoding: utf-8
require 'carrierwave/processing/mini_magick'
class UploadAvatarUploader < CarrierWave::Uploader::Base
  require "carrierwave/mongoid"

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    'avatar'
  end


  # Create different versions of your uploaded files:
   version :thumb, :if => :image? do
    process :resize_to_fill => [80, 80]
  end
   version :large, :if => :image?  do
    process :resize_to_fill => [120, 120]
  end

  protected

  def image?(new_file)
    new_file.content_type.include? 'image'
  end
 

end
