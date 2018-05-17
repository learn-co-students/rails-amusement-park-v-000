class Attraction < ApplicationRecord
  has_many :rides
  has_many :users, through: :rides

  #rules for being able to ride the ride
  #can ride?
  #user has to have enough tickets and be tall enough

  #tall_enough
  def tall_enough?(user)
      true if user.height > self.min_height
      false if user.height < self.min_height
  end
  #tickets_enough

end
