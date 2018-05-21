class RemoveJoin < ActiveRecord::Migration[5.2]
  def change
  	drop_table :joins
  end
end
