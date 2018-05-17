class User < ApplicationRecord
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def ticket_count(attraction)
    self.tickets = self.tickets - attraction.tickets
    self.save
  end

  #rules for authorization

  def mood_change
    if self.mood == "happy"
      self.mood = "sad"
    else
      self.mood = "happy"
    end
    self.save
  end

end
