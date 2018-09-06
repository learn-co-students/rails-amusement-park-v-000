class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.integer :happiness
      t.integer :nausea
      t.integer :height
      t.integer :tickets
      t.boolean :admin

      t.timestamps
    end
  end
end
