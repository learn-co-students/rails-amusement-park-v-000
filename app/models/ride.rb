require 'pry'
class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :attraction

    def take_ride
        msg = String.new
        user = User.find(self.user_id)
        attraction = Attraction.find(self.attraction_id)
        if user.tickets < attraction.tickets 
            msg= add_error(msg,"You do not have enough tickets to ride the #{attraction.name}.")
        end
        if user.height < attraction.min_height
            msg= add_error(msg,"You are not tall enough to ride the #{attraction.name}.")
        end
        if msg.length==0
            user.update(:tickets => user.tickets - attraction.tickets,
                        :nausea => user.nausea + attraction.nausea_rating,
                        :happiness => user.happiness + attraction.happiness_rating)
        end
        msg
    end

    private

    def add_error(msg, type)
        msg.concat("Sorry.") if msg.length == 0
        msg.concat(" ") 
        msg.concat(type)
        msg
    end

end
