class User < ApplicationRecord
  has_many :rides
  has_many :attractions, through: :rides

  has_secure_password

  def mood
    if !self.admin
      self.nausea > self.happiness ? "sad" : "happy"
    end
  end

  def update_stats(attraction_stats)
    self.nausea += attraction_stats[:nausea].to_i
    self.happiness += attraction_stats[:happiness].to_i
    self.tickets -= attraction_stats[:tickets].to_i
    
    self.save
  end
end
