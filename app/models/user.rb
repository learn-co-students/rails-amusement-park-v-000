class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides
     
    def mood
        
        if self.nausea && self.happiness
        # returns 'sad' when the user is more nauseous than happy     
            if  nausea > happiness
                    return "sad"
            else
                    return "happy"
                # returns 'happy' when the user is more happy than nauseous
            end
         end
    end

end
