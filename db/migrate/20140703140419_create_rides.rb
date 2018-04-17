class CreateRides < ActiveRecord::Migration
	def change
		create_table :rides do |r|
			r.integer :user_id, :foreign_key => true
			r.integer :attraction_id, :foreign_key => true
		end
	end
end
