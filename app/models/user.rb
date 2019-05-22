class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    if !self.admin
      if self.happiness > self.nausea
        return "happy"
      else
        return "sad"
      end
    end
  end

end
