class Profile < ApplicationRecord
	belongs_to :farmie

	validates_presence_of :farmie_id
	validates :intro, length: { maximum: 80 }
	validates :about, length: { maximum: 255 }
	mount_uploader :picture, PictureUploader
  mount_uploaders :farm_pictures, PictureUploader



	private

end
