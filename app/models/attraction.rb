class Attraction < ApplicationRecord
  # Let's go ahead and copy the pattern in the upper left-hand corner of this
  # diagram here:
  # https://i.imgur.com/TZbbDay.jpg
  # ...in which the following changes will be made:
  # "rides" will replace "comments"
  # "attractions" will replace "posts"
  # ...and users will stay the same.
  has_many :rides
  has_many :users, through: :rides
end
