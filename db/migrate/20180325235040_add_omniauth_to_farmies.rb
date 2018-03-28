class AddOmniauthToFarmies < ActiveRecord::Migration[5.1]
  def change
    add_column :farmies, :provider, :string
    add_column :farmies, :uid, :string
  end
end
