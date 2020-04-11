# require 'pry'
class User < ApplicationRecord
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    # binding.pry
    current_mood = ""
    if self.happiness < 5
      current_mood = "sad"
    else
      current_mood = "happy"
    end
  end
end
