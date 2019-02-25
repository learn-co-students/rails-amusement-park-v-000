class User < ActiveRecord::Base
  has_secure_password

  def mood
    if self.happiness && self.nausea
      if self.happiness > self.nausea
        "happy"
      else
        "sad"
      end
    end
  end
end
