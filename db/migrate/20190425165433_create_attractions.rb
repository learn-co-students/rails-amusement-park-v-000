class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.string :name
      t.string :min_height
      t.string :nausea_rating
      t.string :happiness_rating
      t.string :tickets
    end
  end
end
