class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  has_secure_password

  def mood
    if self.nausea.to_i < self.happiness.to_i
      return "happy"
    else
      return "sad"
    end
  end
end
