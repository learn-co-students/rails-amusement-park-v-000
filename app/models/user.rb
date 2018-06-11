class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    if self.admin == false 
        if self.nausea > self.happiness
          return "sad"
        else
          return "happy"
        end 
    end
  end
end