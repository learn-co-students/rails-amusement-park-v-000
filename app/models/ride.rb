class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
     
        if (self.user.tickets < self.attraction.tickets) && (self.user.height < self.attraction.min_height)
            return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        elsif self.user.tickets < self.attraction.tickets
            return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif self.user.height < self.attraction.min_height
            return "Sorry. You are not tall enough to ride the #{self.attraction.name}."
            #flash[:sorry1] = "You are not tall enough to ride the #{self.attraction.name}"
        else
            #a = self.user.tickets - self.attraction.tickets
            #b = self.user.nausea + self.attraction.nausea_rating
            #c = self.user.happiness + self.attraction.happiness_rating
            #flash[:message] = "Thanks for riding the #{self.attraction.name}!"
            self.user.update(:tickets => self.user.tickets - self.attraction.tickets, 
            :nausea => self.user.nausea + self.attraction.nausea_rating,
            :happiness => self.user.happiness + self.attraction.happiness_rating)
            return "Thanks for riding the #{self.attraction.name}!"
        end
    end

end
