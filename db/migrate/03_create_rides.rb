class CreateRides < ActiveRecord::Migration[4.2]
  def change
    create_table :rides do |t|
      	t.integer :attraction_id
      	t.integer :user_id

      t.timestamps null: false
    end
  end
end