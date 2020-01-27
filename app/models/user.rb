class User < ApplicationRecord
    #validates :name, :nausea, :tickets, :password, :happiness, :height, presence: true

    has_secure_password
    has_many :rides 
    has_many :attractions, through: :rides
    
    def mood 
        self.nausea > self.happiness ? "sad" : "happy" unless self.admin
    end 
end
