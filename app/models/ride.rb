class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride 
        if too_short && too_broke 
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        elsif too_broke && !too_short
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif too_short && !too_broke
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        else
            self.user.tickets = self.user.tickets - self.attraction.tickets
            self.user.happiness = self.user.happiness + self.attraction.happiness_rating
            self.user.nausea = self.user.nausea + self.attraction.nausea_rating
            self.user.save
        end
    end

    def too_short 
        self.attraction.min_height > self.user.height 
    end

    def too_broke 
        self.attraction.tickets > self.user.tickets 
    end
end
