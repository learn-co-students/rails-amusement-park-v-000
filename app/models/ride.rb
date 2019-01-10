class Ride < ActiveRecord::Base

    belongs_to :user
    belongs_to :attraction

    def take_ride
        if !enough_tickets && !enough_height
            "Sorry. " + ticket_message + " " + height_message
        elsif !enough_tickets
            "Sorry. " +  ticket_message
        elsif !enough_height
            "Sorry. " + height_message
        else
            go_ride
        end
    end

    def enough_tickets
        self.user.tickets >= self.attraction.tickets
    end

    def enough_height
        self.user.height >= self.attraction.min_height
    end

    def ticket_message
        "You do not have enough tickets to ride the #{self.attraction.name}."
    end

    def height_message
        "You are not tall enough to ride the #{self.attraction.name}."
    end

    def go_ride
        self.user.update(
            :happiness => (self.user.happiness + self.attraction.happiness_rating),
            :tickets => (self.user.tickets - self.attraction.tickets),
            :nausea => (self.user.nausea + self.attraction.nausea_rating ))
        
    end

end
