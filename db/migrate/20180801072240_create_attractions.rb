class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.string :name
      t.float :min_height
      t.integer :nausea_rating
      t.integer :happiness_rating
      t.string :ticket_number
    end
  end
end
