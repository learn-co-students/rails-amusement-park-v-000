class User < ActiveRecord::Base
  has_secure_password

  has_many :rides 
  has_many :attractions, through: :rides



  def mood 
      if self.nausea && self.happiness
        mood = self.happiness - self.nausea 
      if mood > 0
        "happy"
      else 
      "sad"
      end
    end

  end



end
