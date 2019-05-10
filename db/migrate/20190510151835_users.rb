class Users < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.intger :nausea
      t.intger :happiness
      t.intger :tickets
      t.intger :height
    end
  end
end
