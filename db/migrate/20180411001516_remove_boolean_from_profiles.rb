class RemoveBooleanFromProfiles < ActiveRecord::Migration[5.1]
  def change
    remove_column :profiles, :boolean, :string
  end
end
