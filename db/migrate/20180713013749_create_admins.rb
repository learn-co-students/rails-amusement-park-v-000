class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :name
      t.boolean :admin
      t.string :password
      t.string :password_digest
      t.timestamps
    end
  end
end
