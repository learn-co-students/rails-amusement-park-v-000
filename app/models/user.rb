class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    if self.happiness > self.nausea
      "happy"
    elsif self.nausea > self.happiness
      "sad"
    end

  end
end
