class User < ApplicationRecord
    has_secure_password
    has_many :rides
    has_many :attractions, :through => :rides
    
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :happiness, length: { in: 1..5 }, allow_blank: true
    validates :nausea, length: { in: 1..5 }, allow_blank: true
    def mood
        if self.nausea && self.happiness
             self.nausea > self.happiness ? "sad" : "happy"
        end
    end
end
