class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if !enough_tickets && !tall_enough 
            height_ticket_error
        elsif !enough_tickets 
            "Sorry. " + ticket_error
        elsif !tall_enough
            "Sorry. " + height_error
        else 
            update_stats
            "Thanks for riding the #{self.attraction.name}!"
        end
    end

    def update_stats
        self.user.update(:tickets => (self.user.tickets - self.attraction.tickets),
                         :nausea => (self.user.nausea + self.attraction.nausea_rating),
                         :happiness => (self.user.happiness + self.attraction.happiness_rating)
       )
    end

    def enough_tickets
        self.user.tickets >= self.attraction.tickets
    end

    def tall_enough
        self.user.height >= self.attraction.min_height
    end

    def ticket_error
      "You do not have enough tickets to ride the #{self.attraction.name}."
    end

    def height_error
      "You are not tall enough to ride the #{self.attraction.name}."
    end

    def height_ticket_error
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    end

end
