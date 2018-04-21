class AddPicturesToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :picture, :string
    add_column :profiles, :anonymous_picture, :string
  end
end
