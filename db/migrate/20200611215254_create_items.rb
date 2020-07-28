class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
        t.string :item_1

        
        t.timestamps null:false
    end
  end
end
