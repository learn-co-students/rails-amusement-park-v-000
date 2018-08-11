class User < ActiveRecord::Base
  has_secure_password

  def mood
  if self.happiness && self.nausea
    mood = self.happiness - self.nausea
    mood > 0 ? "happy" : "sad"
  end
end


end
