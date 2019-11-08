class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :name

      # Let's go ahead and copy the pattern in the upper left-hand corner of this
      # diagram here:
      # https://i.imgur.com/TZbbDay.jpg
      # ...in which the following changes will be made:
      # "rides" will replace "comments"
      # "attractions" will replace "posts"
      # ...and users will stay the same.
      t.belongs_to :user, foreign_key: true
      t.belongs_to :attraction, foreign_key: true
    end
  end
end
