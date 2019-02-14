class RemoveUserFromAttractions < ActiveRecord::Migration[5.2]
  def change
    remove_reference :attractions, :user, foreign_key: true
  end
end
