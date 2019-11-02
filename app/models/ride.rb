class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if not_tall_enough? && not_enough_tickets?
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif not_enough_tickets?
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif not_tall_enough? 
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        else 
            start_ride
        end
    end

    private

    def not_enough_tickets?
        self.user.tickets < self.attraction.tickets
    end

    def not_tall_enough?
        self.user.height < self.attraction.min_height
    end

    def start_ride
        self.user.update(tickets: self.user.tickets - self.attraction.tickets, nausea: self.user.nausea + self.attraction.nausea_rating, happiness: self.user.happiness + self.attraction.happiness_rating)
        "Thanks for riding the #{self.attraction.name}!"
    end
end
