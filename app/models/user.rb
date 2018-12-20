class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides
    # validates :happiness, :nausea, :tickets, :height, :password, :name, presence: true
 
    def mood 
        if self.happiness <= self.nausea
            'sad'
        else
            'happy'
        end
    end    



end
