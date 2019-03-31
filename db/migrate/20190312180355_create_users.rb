class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :tickets
      t.integer :nausea
      t.integer :happiness
      t.integer :height
      t.string :password_digest
      t.boolean :admin, :default => true

      t.timestamps
    end
  end
end
