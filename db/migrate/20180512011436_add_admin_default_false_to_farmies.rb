class AddAdminDefaultFalseToFarmies < ActiveRecord::Migration[5.1]
  def change
    change_column :farmies, :admin, :boolean, default: false
  end
end
