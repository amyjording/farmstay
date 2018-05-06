class FarmiePicture < ApplicationRecord
  belongs_to :profile
  mount_uploader :image_path, PictureUploader
end
