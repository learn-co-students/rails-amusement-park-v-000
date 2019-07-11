class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if (user.tickets < attraction.tickets) && (user.height < attraction.min_height)
            return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif user.tickets < attraction.tickets
            return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif user.height < attraction.min_height
            return "Sorry. You are not tall enough to ride the #{attraction.name}."
        else
            a = user.tickets - attraction.tickets
            b = user.nausea + attraction.nausea_rating
            c = user.happiness + attraction.happiness_rating
            user.update(:tickets => a, :nausea => b, :happiness => c)
        end
    end

end
