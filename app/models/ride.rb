class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    # def take_ride
    
    # end

    # accounts for the user not having enough tickets
    # accounts for the user not being tall enough
    # accounts for the user not being tall enough and not having enough tickets
    # updates ticket number
    # updates the user's nausea
    # updates the user's happiness
end
