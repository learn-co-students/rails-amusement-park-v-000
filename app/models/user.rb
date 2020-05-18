class User < ActiveRecord::Base
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  def is_admin?
    true unless self.admin == false
  end

  def mood
    if !self.is_admin?
      # returns 'sad' when the user is more nauseous than happy
      if self.nausea > self.happiness
        "sad"
      else # returns 'happy' when the user is more happy than nauseous
        "happy"
      end
    end
  end

end
