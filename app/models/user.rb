class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.nausea && self.happiness
      if self.nausea > self.happiness
        return "sad"
      else
        return "happy"
      end
    end
  end
end
