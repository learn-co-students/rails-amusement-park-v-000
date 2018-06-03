class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.nausea > self.happiness
      mood = "sad"
    else
      mood = "happy"
    end
    mood
  end 
end
