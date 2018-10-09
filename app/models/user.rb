class User < ActiveRecord::Base
  has_secure_password
  validates :password_digest, presence: true
  has_many :rides
  has_many :attractions
  has_many :attractions, through: :rides

  def mood
    if self.nausea && self.happiness
      if self.nausea >= self.happiness
        "sad"
      elsif self.nausea < self.happiness
        "happy"
      end
    end
  end

end
