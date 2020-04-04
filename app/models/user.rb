class User < ActiveRecord::Base

    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password

    def mood
        if self.nausea > self.happiness
            mood = "sad"
        else
            mood = "happy"
        end 
    end 

end
