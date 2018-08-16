class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.integer :happiness
      t.integer :nausea
      t.float :height
      t.integer :tickets
      t.boolean :admin, default: 0

      t.timestamps
    end
  end
end
