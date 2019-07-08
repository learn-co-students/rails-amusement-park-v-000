class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides

    def take_ride 
        
    end
end
