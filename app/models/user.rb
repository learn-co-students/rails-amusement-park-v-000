class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.nausea && self.happiness
      if self.nausea > self.happiness
        "sad"
      else
        "happy"
      end
    else
      "n/a"
    end
  end

  def admin_status
    if self.admin
      "ADMIN"
    else
      ""
    end
  end
end
