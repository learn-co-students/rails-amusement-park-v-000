class CreateAttactions < ActiveRecord::Migration[5.2]
  def change
    create_table :attactions do |t|
      t.string :name
      t.string :minimum_height
      t.string :happiness_rating
      t.string :nausea_rating
      t.integer :tickets
    end
  end
end
