class CreateAttracions < ActiveRecord::Migration[5.2]
  def change
    create_table :attracions do |t|
      t.string :name
      t.integer :tickets
      t.integer :nausea_rating
      t.integer :happiness_rating
      t.integer :min_height

      t.timestamps
    end
  end
end
