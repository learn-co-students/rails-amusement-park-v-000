class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def enough_tickets?
        self.attraction.tickets < user.tickets 
    end

    def tall_enough?
        self.attraction.min_height <= user.height
    end

    def take_ride
        if enough_tickets? && tall_enough?
            user.tickets -= self.attraction.tickets
            user.nausea += self.attraction.nausea_rating
            user.happiness += self.attraction.happiness_rating
            user.save
        elsif !enough_tickets? && tall_enough?
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif enough_tickets? && !tall_enough?
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        else
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        end
    end
end
