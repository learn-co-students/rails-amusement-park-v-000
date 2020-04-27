class User < ApplicationRecord
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def is_admin?
    if self.admin != true && self.admin != "true" && self.admin != "t" && self.admin != 1 && self.admin != "1"
      false
    else
      true
    end
  end

  def mood
    if self.admin != true && self.admin != "true" && self.admin != "t" && self.admin != 1 && self.admin != "1"
      if self.happiness < self.nausea
        "sad"
      else
        "happy"
      end
    end
  end
end
