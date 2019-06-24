class Ride < ApplicationRecord
    belongs_to :attraction
    belongs_to :user

    def take_ride
        if (user.tickets < attraction.tickets && user.height < attraction.min_height)
            return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif (user.tickets < attraction.tickets)
            return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif (user.height < attraction.min_height)
            return "Sorry. You are not tall enough to ride the #{attraction.name}."
        end 
        user.tickets = user.tickets - attraction.tickets
        user.nausea += attraction.nausea_rating
        user.happiness += attraction.happiness_rating  
        user.save 
    end

    def update_user
        user.tickets -=attraction.tickets
        user.nausea += attraction.nausea_rating
        user.happiness +=attraction.happiness_rating
        user.save
    end
    
     def good_ride?
        user.tickets >= attraction.tickets && user.height >= attraction.min_height
     end
end
