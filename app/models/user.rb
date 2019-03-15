class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides
  validates :password_digest, presence: true

  def mood
    if self.happiness && self.nausea
      if self.nausea >= self.happiness
        return "sad"
      else
        return "happy"
      end
    end
  end
end
