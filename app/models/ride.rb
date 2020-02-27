class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
       # binding.pry
        attraction = self.attraction
        user = self.user
       # binding.pry
        if user.tickets < attraction.tickets && user.height < attraction.min_height
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif user.tickets < attraction.tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif user.height < attraction.min_height 
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        else
            current_tickets = user.tickets - attraction.tickets
            current_nausea = user.nausea + attraction.nausea_rating
            current_happiness = user.happiness + attraction.happiness_rating
            
            user.update(tickets: current_tickets, happiness: current_happiness, nausea: current_nausea)
            "Thank you for riding the #{attraction.name}."
        end

    end

end
