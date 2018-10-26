class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    validates :user_id, :presence => true
    validates :attraction_id, :presence => true

    def take_ride
        #accounts for the user not having enough ticket & user not tall enough
        # Updates ticket number 
        #update Users Nausea
        #update user happiness
        
    end
end
