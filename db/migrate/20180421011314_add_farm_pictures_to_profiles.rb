class AddFarmPicturesToProfiles < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'btree_gin'

    add_column :profiles, :farm_pictures, :text, array: true, default: []

    add_index :profiles, :farm_pictures, using: 'gin'
  end
end
