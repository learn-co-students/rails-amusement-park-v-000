class User < ApplicationRecord
    has_many :rides
    has_many :attractions, through: :rides
    
    has_secure_password
    
  def mood
    if self.happiness && self.nausea
      mood = self.happiness - self.nausea
      mood > 0 ? "happy" : "sad"
    end
  end

  def num_of_rides
    self.attractions.count
  end
  
end
