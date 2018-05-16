class User < ApplicationRecord
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def ticket_count(attraction)
    self.tickets = self.tickets - attraction.tickets
    #self.save
  end

  def mood
    if self.happiness && self.happiness > 0
      @mood = "happy"
    else
      @mood = "sad"
    end
    @mood
  end
end
