# # Made with the following bash command:
# rails g migration CreateAttractions name:string tickets:integer nausea_rating:integer happiness_rating:integer min_height:integer --no-test-framework
class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.string :name
      t.integer :tickets
      t.integer :nausea_rating
      t.integer :happiness_rating
      t.integer :min_height
    end
  end
end
