class User < ActiveRecord::Base
  has_secure_password

  has_many :rides
  has_many :attractions, :through => :rides

  def mood
    if self.nausea.to_i > self.happiness.to_i
      mood = "sad"
    else
      self.happiness.to_i > self.nausea.to_i
      mood = "happy"
    end
  end

end
