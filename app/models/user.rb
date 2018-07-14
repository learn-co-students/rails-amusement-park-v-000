class User < ActiveRecord::Base
  has_secure_password
  validates :password, presence: true
  validates :admin, inclusion: { in: [true, false] }

  has_many :rides
  has_many :attractions, through: :rides

  def is_admin?
    self.admin
  end

  def mood
    if self.nausea && self.happiness
      if self.nausea > self.happiness
        "sad"
      else
        "happy"
      end
    end
  end
end
