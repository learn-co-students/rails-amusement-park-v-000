class AddRidesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :user_id
      t.integer :attraction_id

      t.timestamps
    end
  end
end
