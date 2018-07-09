class User < ActiveRecord::Base

    has_secure_password
    
    def user_name
        self.name
    end 
    
    def mood
        if self.happiness && self.nausea
            if self.happiness > self.nausea
                @mood = "happy"
            else
                @mood = "sick"
            end 
            
        end 
    end 
end
