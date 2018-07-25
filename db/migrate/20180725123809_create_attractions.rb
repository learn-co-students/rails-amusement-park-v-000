class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.string :name
      t.integer :tickets
      t.integer :min_height
      t.integer :happiness_rating
      t.integer :nausea_rating

      t.timestamps
    end
  end
end
