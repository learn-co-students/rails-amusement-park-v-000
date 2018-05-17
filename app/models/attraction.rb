class Attraction < ApplicationRecord
  has_many :rides
  has_many :users, through: :rides

  def tall_enough?(user)
    true unless user.height < self.min_height
  end

  def tickets_enough?(user)
    true unless user.tickets < self.tickets
  end

  

end
