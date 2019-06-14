class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :name
      t.integer :tickets, :default => 0
      t.integer :nausea_rating, :default => 0
      t.integer :happiness_rating, :default => 0
      t.integer :min_height, :default => 0
      t.integer :user_id
      t.integer :attraction_id
    end
  end
end
