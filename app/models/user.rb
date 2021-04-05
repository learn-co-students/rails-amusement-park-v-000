class User < ApplicationRecord
    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password

    def mood 
        unless admin
            self.happiness >= self.nausea ? 'happy' : 'sad'
        end
    end
end
