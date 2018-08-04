class User < ApplicationRecord
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.happiness && self.nausea
      if self.happiness > self.nausea
        "happy"
      elsif self.happiness < self.nausea
        "sad"
      end
    end
  end
end
