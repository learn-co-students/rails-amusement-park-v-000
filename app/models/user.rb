class User < ApplicationRecord
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    if self.happiness > 0
      @mood = "happy"
    else
      @mood = "sad"
    end
    @mood 
  end
end
