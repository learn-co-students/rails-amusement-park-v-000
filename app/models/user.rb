class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    unless admin
      if self.nausea > self.happiness
        "sad"
      else
        "happy"
      end
    end
  end
end
