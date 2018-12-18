class User < ApplicationRecord
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password


  def mood
    if self.happiness && self.nausea
     if self.happiness < self.nausea
       mood = "sad"
    else
       mood = "happy"
     end
    end
  end
end
