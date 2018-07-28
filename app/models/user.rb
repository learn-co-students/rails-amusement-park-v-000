class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    if self.nausea == nil || self.happiness == nil
      nil
    elsif self.nausea > self.happiness
      "sad"
    else
      "happy"
    end
  end
end
