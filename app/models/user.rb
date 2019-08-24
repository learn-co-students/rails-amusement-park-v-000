class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password

    def admin
        if self.admin = "f"
            false
        elsif self.admin = "t"
            true
        else
            nil
        end
    end
    
    def mood
        if self.happiness < self.nausea
            "sad"
        else
            "happy"
        end
    end
end
