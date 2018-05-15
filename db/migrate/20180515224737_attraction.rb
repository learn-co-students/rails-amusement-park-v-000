class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.string :name
      t.integer :tickets
      t.integer :nausea_rating
      t.integer :happiness_rating
      t.integer :min_height
      t.timestamps
    end
  end
end

def change
  create_table :users do |t|
    t.string :name
    t.string :password_digest
    t.integer :nausea
    t.integer :happiness
    t.integer :tickets
    t.integer :height
    t.timestamps
  end
