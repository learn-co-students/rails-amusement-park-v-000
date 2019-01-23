class User < ApplicationRecord
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    if self.happiness - self.nausea > 0
      "happy"
    elsif self.happiness - self.nausea < 0
      "sad"
    end
  end
end
