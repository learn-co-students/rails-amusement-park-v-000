class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if enough_tickets && tall_enough
            update_tickets
            update_nausea
            update_happiness
            "Thanks for riding the #{self.attraction.name}!"
        elsif !enough_tickets && tall_enough
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif enough_tickets && !tall_enough
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        else
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        end
    end

    def enough_tickets
        self.user.tickets >= self.attraction.tickets
    end

    def tall_enough
        self.user.height >= self.attraction.min_height
    end

    def update_happiness
        update_happy = self.user.happiness + self.attraction.happiness_rating
        self.user.update(happiness: update_happy)
    end

    def update_nausea
        update_nausea = self.user.nausea + self.attraction.nausea_rating
        self.user.nausea = update_nausea
    end

    def update_tickets
        update_tix = self.user.tickets - self.attraction.tickets
        self.user.tickets = update_tix
    end
end
