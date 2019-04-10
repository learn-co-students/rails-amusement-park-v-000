class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if self.user.tickets < self.attraction.tickets || self.user.height < self.attraction.min_height
            messages = 'Sorry.'
            if self.user.tickets < self.attraction.tickets
                messages << " You do not have enough tickets to ride the #{self.attraction.name}."
            end
            if self.user.height < self.attraction.min_height
                messages << " You are not tall enough to ride the #{self.attraction.name}."
            end
            return messages
        elsif self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
            return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
            
        else
            self.user.tickets -= self.attraction.tickets
            self.user.nausea += self.attraction.nausea_rating
            self.user.happiness += self.attraction.happiness_rating
            user.update(tickets: self.user.tickets, nausea: self.user.nausea, happiness: self.user.happiness)
            return "Thanks for riding the #{self.attraction.name}!"
        end
    end 
    
end
