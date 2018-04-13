class AddShowVisitedFarmsToProfiles < ActiveRecord::Migration[5.1]
  def change
  	add_column :profiles, :show_visited_farms, :boolean, default: false
  end
end
