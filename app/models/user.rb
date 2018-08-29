class User < ApplicationRecord
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.nausea && self.happiness
      case
      when self.happiness > self.nausea
        return "happy"
      when self.happiness < self.nausea
        return "sad"
      end
    end
  end

  def admin_status
    if self.admin
      "ADMIN"
    end
  end

end
