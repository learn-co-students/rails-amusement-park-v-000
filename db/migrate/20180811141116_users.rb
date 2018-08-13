class Users < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :height
      t.string :mood
      t.integer :tickets
      t.string :password_digest
      t.string :happiness
    end
  end
end
