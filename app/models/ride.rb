class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def tall_enough?
        self.user.height >= self.attraction.min_height
    end

    def enough_tickets?
        self.user.tickets > self.attraction.tickets
    end

    def take_ride
        user = User.find(user_id)
        attraction = Attraction.find(attraction_id)
        if enough_tickets? && tall_enough?
            new_nausea = attraction.nausea_rating + user.nausea
            new_tickets = user.tickets - attraction.tickets
            new_happiness = user.happiness + attraction.happiness_rating
            user.update(nausea: new_nausea, tickets: new_tickets, happiness: new_happiness)
            message = "Thanks for riding the #{self.attraction.name}!"
        elsif !enough_tickets? && !tall_enough?
            message = "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        elsif !enough_tickets?
            message = "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif !tall_enough?
            message = "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        end
    end
end
