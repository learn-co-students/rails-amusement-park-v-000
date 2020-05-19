class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    self.nausea > self.happiness ? "sad" : "happy"
  end
end
