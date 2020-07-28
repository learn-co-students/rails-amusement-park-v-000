class AddFoodIdToItems < ActiveRecord::Migration[5.2]
  def change
     add_reference :items, :food, index: true, foreign_key: true
  end
     
  end

