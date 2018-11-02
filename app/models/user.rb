class User < ActiveRecord::Base
  has_secure_password

  def mood
    if self.nausea > self.happiness
      "sad"
    elsif self.happiness > self.nausea
      "happy"
    else
      "neutral"
    end
  end
end
