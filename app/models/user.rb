class User < ApplicationRecord
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.nausea && self.happiness
      mood = self.try(:happiness) - self.try(:nausea)
      mood > 0 ? 'happy' : 'sad'
    end
  end
end
