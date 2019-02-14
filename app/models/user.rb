class User < ApplicationRecord
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    rating = self.nausea > self.happiness

    rating ? "sad" : "happy"
  end
end
