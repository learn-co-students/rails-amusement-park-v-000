class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    self.happiness.to_i >= self.nausea.to_i ? "happy" : "sad"
  end
end
