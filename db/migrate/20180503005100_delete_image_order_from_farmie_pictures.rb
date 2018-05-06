class DeleteImageOrderFromFarmiePictures < ActiveRecord::Migration[5.1]
def change
  remove_column :farmie_pictures, :image_order, :integer
  end
end
