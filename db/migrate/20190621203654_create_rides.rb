class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.integer :attraction_id
      t.integer :user_id

      t.timestamps
    end
  end
end
