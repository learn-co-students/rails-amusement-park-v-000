class User < ApplicationRecord
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  validates_presence_of :name, :password

  def mood
    if self.happiness && self.nausea
      if self.happiness > self.nausea
        "happy"
      elsif self.nausea > self.happiness
        "sad"
      end
    end
  end

end
