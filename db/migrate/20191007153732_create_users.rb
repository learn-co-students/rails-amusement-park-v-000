class CreateUsers < ActiveRecord::Migration[5.2]
  def up
    create_table :users do |t|
      t.string :name
      t.integer :height
      t.integer :nausea
      t.integer :happiness
      t.integer :dollars
      t.integer :tickets
      t.boolean :admin, :default =>  false
      #Ex:- :default =>''
      t.string :password_digest
    end
  end

  def down 
    drop_table :users
  end
end
