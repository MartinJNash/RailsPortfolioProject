# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  storage :file
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  version :fullsize do
    process resize_to_fit: [1024, 1024]
  end

  version :display do
    process resize_to_fit: [256, 256]
  end

  version :thumb do
    process resize_to_fit: [48, 48]
  end

end
