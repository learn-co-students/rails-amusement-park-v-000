require 'pry'

class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user 

    def take_ride
        if user_has_enough_tickets && user_is_tall_enough
            start_ride
        elsif !user_has_enough_tickets && !user_is_tall_enough
            "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the #{self.attraction.name}."
        elsif !user_is_tall_enough
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        elsif !user_has_enough_tickets
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        end
    end

    def start_ride
        new_happiness = self.user.happiness + self.attraction.happiness_rating 
        new_nausea = self.user.nausea + self.attraction.nausea_rating
        new_tickets = self.user.tickets - self.attraction.tickets 
        
        user.update(:happiness => new_happiness, :nausea => new_nausea, :tickets => new_tickets)

        "Thanks for riding the #{self.attraction.name}!"
    end

    def user_meets_requirements
        self.user_has_enough_tickets && self.user_is_tall_enough 
    end

    def user_has_enough_tickets 
        self.user.tickets >= self.attraction.tickets 
    end

    def user_is_tall_enough
        self.user.height >= self.attraction.min_height.to_i 
    end

end
