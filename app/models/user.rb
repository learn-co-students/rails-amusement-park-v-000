class User < ApplicationRecord
  has_many :rides
  has_many :attractions, through: :rides

  has_secure_password

  def mood
    self.nausea > self.happiness ? "sad" : "happy"
  end

  def update_stats(attraction_stats)
    self.nausea += attraction_stats[:nausea]
    self.happiness += attraction_stats[:happiness]
    self.tickets -= attraction_stats[:tickets]
    
    self.save
  end
end
