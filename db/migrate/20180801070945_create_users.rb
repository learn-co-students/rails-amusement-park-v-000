class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.integer :happiness
      t.integer :nausea
      t.float :height
      t.boolean :tickets
      t.boolean :admin, default: 0
    end
  end
end
