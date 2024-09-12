class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :user_id
      t.string :attraction_id
    end
  end
end
