class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.integer :user_id
      t.integer :attraction_id

      t.timestamps :null => false
    end
  end
end
