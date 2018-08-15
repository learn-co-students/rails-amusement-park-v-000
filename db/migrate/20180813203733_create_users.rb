class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.integer :happiness
      t.integer :nausea
      t.integer :height
      t.integer :tickets
      t.string :password_digest

      t.timestamps
    end
  end
end
