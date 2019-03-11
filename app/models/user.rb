class User < ApplicationRecord
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.happiness && self.nausea
      self.happiness > self.nausea ? "happy" : "sad"
    end
  end

  def num_of_rides
    self.attractions.count
  end
end
