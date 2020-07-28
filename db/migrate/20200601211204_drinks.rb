class Drinks < ActiveRecord::Migration[5.2]
  def change
       create_table :drinks do |t|
         t.string :business
         t.text :website

         t.timestamps
       end
     end
end
