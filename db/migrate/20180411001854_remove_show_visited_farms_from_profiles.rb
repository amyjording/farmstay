class RemoveShowVisitedFarmsFromProfiles < ActiveRecord::Migration[5.1]
  def change
  	remove_column :profiles, :show_visited_farms, :string
  end
end
