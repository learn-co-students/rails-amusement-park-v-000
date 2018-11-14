class Ride < ActiveRecord::Base
    belongs_to :user 
    belongs_to :attraction 

    def take_ride 
        attraction = self.attraction
        user = self.user
        if attraction.tickets > user.tickets && attraction.min_height > user.height 
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif attraction.tickets > user.tickets 
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif attraction.min_height > user.height 
             "Sorry. You are not tall enough to ride the #{attraction.name}."
        else
            current_tickets = user.tickets - attraction.tickets 
            current_nausea = user.nausea + attraction.nausea_rating 
            current_happiness = user.happiness + attraction.happiness_rating 

            user.update(tickets: current_tickets, nausea: current_nausea, happiness: current_happiness)
            "Thanks for riding the #{attraction.name}!"
            end
        end
    end
    