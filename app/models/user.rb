class User < ApplicationRecord
    has_secure_password
    has_many :rides
    has_many :attractions, :through => :rides
    
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :happiness, length: { in: 1..5 }
    validates :nausea, length: { in: 1..5 }
    def mood
        if self.nausea > self.happiness
            "sad"
        else
            "happy"
        end
    end
end
