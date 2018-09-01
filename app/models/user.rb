class User < ApplicationRecord
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password


  def mood
    if self.nausea > self.happiness
      return "sad"
    else
      return "happy"
    end
  end
end
