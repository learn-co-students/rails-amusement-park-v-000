class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user


    def take_ride
        if self.attraction.tickets > self.user.tickets && self.attraction.min_height > self.user.height
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        elsif self.attraction.tickets > self.user.tickets
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif self.attraction.min_height > self.user.height
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        elsif self.attraction.tickets < self.user.tickets
            self.user.tickets -= self.attraction.tickets
            self.user.nausea += self.attraction.nausea_rating
            self.user.happiness += self.attraction.happiness_rating
            self.user.save 
            "Thanks for riding the #{self.attraction.name}!"
        end
    end


end
