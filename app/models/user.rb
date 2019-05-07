class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    
    has_secure_password

    def mood
        #            if self.user.nausea > self.user.happiness
        #user.mood == sad
        #if self.user.nausea < self.user.happiness
        #    user.mood == happy
        #end 
    end
end
