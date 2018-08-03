class User < ActiveRecord::Base

  has_secure_password

  has_many :rides
  has_many :attractions, :through => :rides

#"has a method 'mood' that returns 'sad' when the user is more nauseous than happy"
#"has a method 'mood' that returns 'happy' when the user is more happy than nauseous"


def mood
  if self.happiness && self.nausea
    mood = self.happiness - self.nausea
    mood > 0 ? "happy" : "sad"
  end
end



end
