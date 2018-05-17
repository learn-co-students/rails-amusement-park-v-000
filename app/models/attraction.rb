class Attraction < ApplicationRecord
  has_many :rides
  has_many :users, through: :rides

  def tall_enough?(user)
    byebug
    if user.height < self.min_height
      @answer = false
    else
      @answer = true
    end
    @answer
    #true unless user.height < self.min_height
  end

  def tickets_enough?(user)
    if user.tickets < self.tickets
      @answer = false
    else
      @answer = true
    end
    @answer
    #true unless user.tickets < self.tickets
  end

end
