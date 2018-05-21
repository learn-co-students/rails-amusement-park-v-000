class CreateJoin < ActiveRecord::Migration[5.2]
  def change
    create_table :joins do |t|
      t.integer :user_id
      t.integer :attraction_id
    end
  end
end
