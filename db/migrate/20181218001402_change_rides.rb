class ChangeRides < ActiveRecord::Migration[5.2]
  def change
    change_table :rides do |t|
      t.remove :name, :tickets, :nausea_rating, :happiness_rating, :min_height
      t.integer :attraction_id
      t.integer :user_id
    end
  end
end
