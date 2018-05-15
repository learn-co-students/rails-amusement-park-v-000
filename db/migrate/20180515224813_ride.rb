class Ride < ActiveRecord::Migration[5.2]
  def change
    t.integer :user_id
    t.integer :attraction_id
  end
end
