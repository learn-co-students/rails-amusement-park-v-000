class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        user = User.find(self.user_id)
        attraction = Attraction.find(self.attraction_id)
        if !enough_tickets? && !tall_enough?
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif !enough_tickets?
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif !tall_enough?
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        else
            user.tickets = user.tickets - attraction.tickets
            user.tickets = 0 if user.tickets < 0

            user.happiness = user.happiness + attraction.happiness_rating

            user.nausea = user.nausea + attraction.nausea_rating

            user.save!
            "Thanks for riding the #{attraction.name}!"
        end
    end

    private 

    def enough_tickets?
        user = User.find(self.user_id)
        attraction = Attraction.find(self.attraction_id)

        user.tickets >= attraction.tickets ? true : false
    end

    def tall_enough?
        user = User.find(self.user_id)
        attraction = Attraction.find(self.attraction_id)
        
        user.height >= attraction.min_height ? true : false
    end
    # accounts for the user not having enough tickets
    # accounts for the user not being tall enough
    # accounts for the user not being tall enough and not having enough tickets
    # updates ticket number
    # updates the user's nausea
    # updates the user's happiness
end
