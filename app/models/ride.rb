class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        enough_tickets, tall_enough = meet_requirements

        if enough_tickets && tall_enough
            start_ride
        elsif enough_tickets && !tall_enough
            "Sorry. " + missing_height_requirement
        elsif tall_enough && !enough_tickets
            "Sorry. " + missing_ticket_requirement
        else
            "Sorry. " + missing_ticket_requirement + " " + missing_height_requirement
        end
    end

    def meet_requirements
        # start with 0
        enough_tickets, tall_enough = false
        # if user has more or the exact number of tickets, set the enough_tickets variable to be truthy
        if self.user.tickets >= self.attraction.tickets 
            enough_tickets = true 
        end
        # if user's height is equal or greater than an attraction's min_height, set the tall_enough variable to be truthy
        if self.user.height >= self.attraction.min_height 
            tall_enough = true 
        end
        return [enough_tickets, tall_enough]
    end

    def start_ride
        new_happiness = self.user.happiness + self.attraction.happiness_rating
        new_nausea = self.user.nausea + self.attraction.nausea_rating
        new_tickets = self.user.tickets - self.attraction.tickets

        self.user.update(
            happiness: new_happiness,
            nausea: new_nausea,
            tickets: new_tickets
        )

        "Thanks for riding the #{self.attraction.name}!"
    end

    def missing_height_requirement
        "You are not tall enough to ride the #{self.attraction.name}."
    end

    def missing_ticket_requirement
        "You do not have enough tickets to ride the #{self.attraction.name}."
    end
end
