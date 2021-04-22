class Desserts < ActiveRecord::Migration[5.2]
   def change
        create_table :desserts do |t|
              t.string :user_id
              t.string :food_id

          t.timestamps
        end
      end
end
