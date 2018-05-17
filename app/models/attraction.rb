class Attraction < ApplicationRecord
  has_many :rides
  has_many :users, through: :rides

  def tall_enough?(user)
    byebug
      true if user.height > self.min_height
      false if user.height < self.min_height
  end

  def tickets_enough(user)
    true if user.tickets > self.tickets
    false if user. tickets < self.tickets
  end

end
