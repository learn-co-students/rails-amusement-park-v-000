class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :name
      t.integer :tickets
      t.integer :nausea_rating
      t.integer :happiness_rating
      t.integer :min_height
      t.belongs_to :user, foreign_key: true
      t.belongs_to :attraction, foreign_key: true
      
      t.timestamps
    end
  end
end
