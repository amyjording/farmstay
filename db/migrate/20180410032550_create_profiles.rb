class CreateProfiles < ActiveRecord::Migration[5.1]
	def change

		create_table :profiles do |t|
			t.text :intro
			t.text :about
			t.integer :farmie_id
			t.string :show_visited_farms, default: false
			t.string :boolean

			t.timestamps
		end
	end
end
