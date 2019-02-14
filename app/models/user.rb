class User < ActiveRecord::Base
    has_secure_password
    has_many :rides 
    has_many :attractions, through: :rides

    def mood 
        # binding.pry
        if self.happiness && self.nausea 
            self.happiness > self.nausea ? 'happy' : 'sad'
        end
    end 

end
