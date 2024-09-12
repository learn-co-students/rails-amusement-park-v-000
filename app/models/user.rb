class User < ActiveRecord::Base
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  def mood
    # "happy" unless self.happiness < self.nausea

    if self.happiness < self.nausea
      "sad"
    elsif self.happiness > self.nausea
      "happy"
    end
  end
end
