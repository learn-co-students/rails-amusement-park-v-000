class Attraction < ApplicationRecord
    #validates :name, :tickets, :nausea_rating, :happiness_rating, :min_height, presence: true
    
    has_many :rides
    has_many :users, through: :rides

    def take_ride 
        if self.tickets > self.user.tickets 
            "You do not have enough tickets to ride the #{self.ride.name}"
            end
    end
end
