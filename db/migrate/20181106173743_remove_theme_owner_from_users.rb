class RemoveThemeOwnerFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :theme_owner, :boolean
  end
end
