class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.integer :nausea, default: 0
      t.integer :happiness, default: 0
      t.integer :tickets, default: 0
      t.integer :height
      t.boolean :admin, default: false
      t.timestamps
    end
  end
end
