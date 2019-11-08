class Ride < ActiveRecord::Base
  # Let's go ahead and copy the pattern in the upper left-hand corner of this
  # diagram here:
  # https://i.imgur.com/TZbbDay.jpg
  # ...in which the following changes will be made:
  # "rides" will replace "comments"
  # "attractions" will replace "posts"
  # ...and users will stay the same.
  belongs_to :user
  belongs_to :attraction
end
