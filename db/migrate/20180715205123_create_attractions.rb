class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :names do |t|
      t.string :min_height
      t.integer :naseau_rating
      t.integer :happiness_rating
      t.integer :ticket_number
      t.timestamps
    end
  end
end
