class User < ApplicationRecord
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    def mood
        if self.admin == false
            if self.nausea > self.happiness
                'sad'
            else
                'happy'
            end
        else
            "Not applicable"
        end
    end
end
