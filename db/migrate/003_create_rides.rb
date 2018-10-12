class CreateRides < ActiveRecord::Migration[4.2]
  def change
    create_table :rides do |t|
      t.string :type
      t.integer :user_id
      t.integer :attraction_id
    end
  end
  
end