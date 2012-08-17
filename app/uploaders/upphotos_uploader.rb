# encoding: utf-8

class UpphotosUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
   include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/photos"
  end


  # Create different versions of your uploaded files:
   version :scan, :if => :image?  do
    process :resize_to_fill => [120, 120]
  end
   version :large, :if => :image?  do
    process :resize_to_limit => [360, 360]
  end
   


  # def filename
  #   "something.jpg" if original_filename
  # end
  protected

  def image?(new_file)
    new_file.content_type.include? 'image'
  end

end
