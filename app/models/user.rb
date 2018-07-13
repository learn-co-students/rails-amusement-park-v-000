class User < ActiveRecord::Base
  validates :password, presence: true
  validates :admin, inclusion: { in: [true, false] }

  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    if self.nausea > self.happiness
      "sad"
    else
      "happy"
    end
  end
end
