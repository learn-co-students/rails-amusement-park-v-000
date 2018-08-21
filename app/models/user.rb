class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  has_secure_password

  def mood
    if self.nausea && self.happiness
      self.nausea > self.happiness ? "sad" : "happy"
    else
      nil
    end
  end
end
