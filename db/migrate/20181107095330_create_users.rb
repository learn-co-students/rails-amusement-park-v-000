class CreateUsers < ActiveRecord::Migration[4.2]
  def change
    create_table :users do |t|
      t.text :name
      t.text :password_digest
      t.integer :nausea
      t.integer :happiness
      t.integer :tickets
      t.integer :height

      t.timestamps
    end
  end
end
