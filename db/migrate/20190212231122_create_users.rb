class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.integer :nausea
      t.integer :happiness
      t.integer :tickets
      t.integer :height

      t.timestamps
    end
  end
end
