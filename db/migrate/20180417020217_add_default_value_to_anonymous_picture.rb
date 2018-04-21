class AddDefaultValueToAnonymousPicture < ActiveRecord::Migration[5.1]
  def change
  	change_column :profiles, :anonymous_picture, :string, default: "farmer-penguin.jpg"
  end
end
