class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides 

    def mood
        mood = 'normal'
        if self.happiness == nil
            self.happiness = 0
        end

        if self.nausea == nil 
            self.nausea = 0
        end 

        if self.happiness > self.nausea
            mood = 'happy'
        else
            mood = 'sad'
        end
        mood
    end

end
