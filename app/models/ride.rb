class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if enough_tickets? && tall_enough?
            update_after_ride
        else
            requirements_info
        end
    end

    private

    def update_after_ride 
        self.user.tickets -= self.attraction.tickets
        self.user.happiness += self.attraction.happiness_rating
        self.user.nausea += self.attraction.nausea_rating
        self.user.save
    end
    def requirements_info 
        message = []
        message << "Sorry." 
        if !enough_tickets? 
            message << "You do not have enough tickets to ride the #{attraction.name}."
        end
        if !tall_enough?
            message << "You are not tall enough to ride the #{attraction.name}." 
        end
        message.join(" ")
    end
    def enough_tickets?
        self.user.tickets >= self.attraction.tickets
    end
    def tall_enough?
        self.user.height >= self.attraction.min_height
    end
end
