class CreateUserTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.integer :nausea
      t.integer :happiness
      t.integer :tickets
      t.integer :height
      t.boolean :admin
    end
    create_table :attractions do |t|
      t.string :name
      t.integer :ticket
      t.integer :nausea_rating
      t.integer :happiness_rating
      t.integer :min_height
    end
    create_table :rides do |t|
      t.integer :user_id
      t.integer :attraction_id
    end
  end
end
