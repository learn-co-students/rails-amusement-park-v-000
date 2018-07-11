class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    if self.happiness && self.nausea
      self.happiness < self.nausea ? "sad" : "happy"
    end
  end

end
