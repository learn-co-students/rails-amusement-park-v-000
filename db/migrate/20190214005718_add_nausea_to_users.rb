class AddNauseaToUsers < ActiveRecord::Migration[5.2]
  
    def change
      add_column :users, :nausea, :string
      add_column :users, :happiness, :string
      add_column :users, :height, :integer
  end
end
