class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides
  before_create :not_admin

  def not_admin
    self.admin = false
  end

  def mood
    if self.nausea != nil
      if self.nausea > self.happiness
        "sad"
      elsif self.happiness > self.nausea
        "happy"
      end
    end
  end
end
