class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.integer :user_id
      t.string :attraction_id
      t.string :integer
    end
  end
end
