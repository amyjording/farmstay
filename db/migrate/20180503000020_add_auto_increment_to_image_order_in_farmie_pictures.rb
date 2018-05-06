class AddAutoIncrementToImageOrderInFarmiePictures < ActiveRecord::Migration[5.1]
  def change
    change_column :farmie_pictures, :image_order, :integer, unique: true, auto_increment: true
  end
end

