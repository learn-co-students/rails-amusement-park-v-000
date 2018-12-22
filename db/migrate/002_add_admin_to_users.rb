class AddAdminToUsers < ActiveRecord::Migration[4.2]
    def change
        change_table :users do |t|
            t.boolean :admin
        end
    end
end