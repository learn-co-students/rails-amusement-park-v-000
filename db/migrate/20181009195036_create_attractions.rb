class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.string :name
      t.integer :min_height
      t.integer :nausea_rating
      t.integer :happiness_rating
      t.integer :ticket_number

      t.timestamps
    end
  end
end
