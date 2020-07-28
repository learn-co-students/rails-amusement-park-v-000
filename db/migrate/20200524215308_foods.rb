class Foods < ActiveRecord::Migration[5.2]
     def change
           create_table :foods do |t|
             t.string :business
             t.text :website
             t.integer :rating

             t.timestamps
           end
         end
   end
