class User < ActiveRecord::Base

    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password
    
    
    def mood
        nausea = self.nausea
        happiness = self.happiness
        if nausea != nil && happiness != nil
          happiness > nausea ? "happy" : "sad"
        end
    end
end
