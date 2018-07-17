class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  validates :password_digest, presence: true

  def mood
    if self.nausea > self.happiness
      mood = "sad"
    else
      mood = "happy"
    end
  end
end
