class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        if self.attraction.tickets < user.tickets 
            if user.height >= self.attraction.min_height
                user.tickets -= self.attraction.tickets
                user.nausea += self.attraction.nausea_rating
                user.mood += self.attraction.happiness_rating
                user.save
            else
                return "Sorry. You are not tall enough to ride the #{self.attraction.name}."
            end
        else
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        end
    end
end
