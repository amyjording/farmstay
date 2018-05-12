class AddAdminToFarmies < ActiveRecord::Migration[5.1]
  def change
    add_column :farmies, :admin, :boolean, default: false
  end
end
