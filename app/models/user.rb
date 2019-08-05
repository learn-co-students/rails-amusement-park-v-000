class User < ActiveRecord::Base
    has_secure_password
    validates :name, presence: true

    has_many :rides
    has_many :attractions, through: :rides


    def mood 
        
        if self.nausea > self.happiness 
           return 'sad'
        else 
           return 'happy'
        end 
    end 
end
