class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :height
      t.integer :happy
      t.integer :nauseous
      t.integer :dollars
      t.boolean :theme_owner

      t.timestamps
    end
  end
end
