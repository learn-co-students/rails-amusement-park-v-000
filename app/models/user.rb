class User < ApplicationRecord
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def ticket_count(attraction)
    self.tickets = self.tickets - attraction.tickets
    self.save
  end

  def mood
    "sad" if self.nausea > self.happiness
  end

  def mood_change
    if self.mood == "happy"
      self.mood = "sad"
    else
      self.mood = "happy"
    end
    self.save
  end

  def nausea_update(attraction)
    self.nausea += attraction.nausea_rating
    self.save
  end

  def happiness_update(attraction)
    self.happiness += attraction.happiness_rating
    self.save
  end


end
