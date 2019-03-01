class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  validates :password_digest, presence: true
  has_secure_password

  def mood
    if self.admin == false
      self.nausea > self.happiness ? "sad" : "happy"
    else
      "ADMIN"
    end
  end
end
