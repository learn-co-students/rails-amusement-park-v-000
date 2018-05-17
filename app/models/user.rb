class User < ApplicationRecord
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if !self.admin
      self.happiness > self.nausea ? "happy" : "sad"
    end
  end
end
