class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |u|
		  u.string :name
	      u.string :password_digest
	      u.integer :nausea
	      u.integer :happiness
	      u.integer :tickets
	      u.integer :height
	      u.boolean :admin, :default => false
		end
	end
end
