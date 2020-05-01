class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    # if self.nausea > self.happiness
    #   return "sad"
    # else
    #   return "happy"
    # end

    self.happiness.to_i >= self.nausea.to_i ? "happy" : "sad"

    # (self.nausea > self.happiness) ? "sad" : "happy"
  end
end