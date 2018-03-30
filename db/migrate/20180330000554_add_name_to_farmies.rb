class AddNameToFarmies < ActiveRecord::Migration[5.1]
  def change
    add_column :farmies, :first_name, :string
    add_column :farmies, :last_name, :string
  end
end
