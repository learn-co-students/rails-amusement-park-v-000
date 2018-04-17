class CreateAttractions < ActiveRecord::Migration
	def change
		create_table :attractions do |a|
		  a.string :name
	      a.integer :tickets
	      a.integer :nausea_rating
	      a.integer :happiness_rating
	      a.integer :min_height
		end
	end
end
