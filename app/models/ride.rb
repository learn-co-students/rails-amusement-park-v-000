class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if !have_enough_tickets? && !tall_enough?
                "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        elsif !have_enough_tickets?
                "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif !tall_enough?
                "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        else go_on_ride
            "Thanks for riding the #{self.attraction.name}!"
        end
    end

    def have_enough_tickets?
        self.user.tickets >= attraction.tickets
    end

    def tall_enough?
        self.user.height >= attraction.min_height 
    end

    def go_on_ride 
        if have_enough_tickets? && tall_enough?
            remaining_tickets = user.tickets - attraction.tickets 
            new_nausea_level = user.nausea + attraction.nausea_rating 
            new_happiness_level = user.happiness + attraction.happiness_rating

            user.update(tickets: remaining_tickets, nausea: new_nausea_level, happiness: new_happiness_level)
            
        end
    end
end
