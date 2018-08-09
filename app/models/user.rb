class User < ActiveRecord::Base
    has_secure_password 
    validates :name, { presence: true, uniqueness: true }

    has_many :rides
    has_many :attractions, through: :rides

    def mood
        # if happiness or nausea not set, then mood is nil
        if self.happiness && self.nausea
            mood = self.happiness - self.nausea
            mood > 0 ? "happy" : "sad"
        end
    end


end
