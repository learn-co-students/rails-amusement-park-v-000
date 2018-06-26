class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  has_secure_password

  def mood
    if self.nausea && self.happiness
      mood = self.happiness - self.nausea
      mood > 0 ? "happy" : "sad"
    end
  end
end
