class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides
    # validates :password, presence: true
    # validates :admin, :default => false
    

    def mood
      
        mood = self.happiness.to_f - self.nausea.to_f
     if mood > 0
        "happy"
     else
         "sad"
     end
    end
end
