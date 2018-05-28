class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :nausea
      t.integer :happines
      t.integer :tickets
      t.integer :height
      t.string :password
      t.string :password_validation
      t.boolean :admin, default: false, null: false
    end
  end
end
