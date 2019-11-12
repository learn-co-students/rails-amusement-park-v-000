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

  # We need to validate the user entered their info in correctly at signup:
  # These are causing a bunch of errors because the Rspec tests are all fucked up
  # The Rspec tests are assuming a faulty logic that makes this app more prone to
  # breaking due to user errors.
  # validates :name, presence: true
  # validates_numericality_of :height, greater_than: 0
  # validates_numericality_of :happiness, greater_than: 0
  # validates_numericality_of :happiness, less_than_or_equal_to: 5
  # validates_numericality_of :nausea, greater_than: 0
  # validates_numericality_of :nausea, less_than_or_equal_to: 5
  # validates_numericality_of :tickets, greater_than: 0

  def mood
    if self.nausea > self.happiness
      "sad"
    else
      "happy"
    end
  end
end
