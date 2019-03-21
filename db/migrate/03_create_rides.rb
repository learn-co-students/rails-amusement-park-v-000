class CreateRides < ActiveRecord::Migration[4.2]
  def change
    create_table :rides do |t|
      t.integer :user_id
      t.integer :attraction_id
    end
  end
end
