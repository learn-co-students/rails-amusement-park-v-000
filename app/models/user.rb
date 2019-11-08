class User < ActiveRecord::Base

  # A user for an app should have a secure password just like the user on this
  # other project does:
  # https://github.com/Richard-Burd/rails-sandbox-1/blob/master/app/models/user.rb
  # this requires the bcrypt gem.
  has_secure_password

  # Let's go ahead and copy the pattern in the upper left-hand corner of this
  # diagram here:
  # https://i.imgur.com/TZbbDay.jpg
  # ...in which the following changes will be made:
  # "rides" will replace "comments"
  # "attractions" will replace "posts"
  # ...and users will stay the same.
  has_many :rides
  has_many :attractions, through: :rides
end
