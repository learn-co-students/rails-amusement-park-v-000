class User < ActiveRecord::Base
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.happiness == nil || (self.nausea > self.happiness)
      "sad"
    elsif self.nausea && self.happiness == nil
      "sad"
    elsif self.nausea < self.happiness
      "happy"
    elsif condition

    end
  end
end
