class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    
    has_secure_password

    def mood
        #binding.pry
        if !self.admin?
            if self.nausea > self.happiness
                "sad"
            else
                "happy"
            end 
        end
    end
end
