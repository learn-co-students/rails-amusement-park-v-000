class CreateUsers < ActiveRecord::Migration[4.2]
  create_table :users do |t|
    t.string :name
    t.string :password_digest
    t.integer :nausea
    t.integer :happiness
    t.integer :tickets
    t.integer :height
  end
end
