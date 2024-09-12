class Ride < ActiveRecord::Base

    belongs_to :attraction
    belongs_to :user

    def take_ride
        user_tickets = self.user.tickets
        attraction_tickets = self.attraction.tickets
        user_height = self.user.height
        attraction_min_height = self.attraction.min_height
        user_happiness = self.user.happiness 
        attraction_happiness = self.attraction.happiness_rating
        user_nausea = self.user.nausea
        attraction_nausea = self.attraction.nausea_rating


        if user_tickets < attraction_tickets && user_height < attraction_min_height
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif user_height < attraction_min_height
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        elsif user_tickets < attraction_tickets 
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        else
            self.user.update(:tickets => (user_tickets - attraction_tickets))
            self.user.update(:nausea => (user_nausea + attraction_nausea))
            self.user.update(:happiness => (user_happiness + attraction_happiness))
            "Thanks for riding the #{attraction.name}!"
        end
    end


end
