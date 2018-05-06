class Profile < ApplicationRecord
	belongs_to :farmie
  has_many :farmie_pictures
  accepts_nested_attributes_for :farmie_pictures, allow_destroy: true

	validates_presence_of :farmie_id
	validates :intro, length: { maximum: 80 }
	validates :about, length: { maximum: 255 }
	mount_uploader :picture, PictureUploader
  

	private

end
