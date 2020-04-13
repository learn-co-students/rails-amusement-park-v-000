class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    

    def take_ride
        attraction = Attraction.find_by(id: self.attraction_id)
        if attraction 
            if !height_check? && !ticket_check?
                "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
            elsif !height_check?
                "Sorry. You are not tall enough to ride the #{attraction.name}."
            elsif !ticket_check?
                "Sorry. You do not have enough tickets to ride the #{attraction.name}."
            else
                ride_taken
                "Thanks for riding the #{attraction.name}!"
            end 
        else 
            "no attraction"
        end

    end


    def height_check?
        user = User.find_by(id: self.user_id)
        attraction = Attraction.find_by(id: self.attraction_id)
        if user && attraction
            user.height > attraction.min_height 
        else 
            false
        end
        
    end 

    def ticket_check?
        user = User.find_by(id: self.user_id)
        attraction = Attraction.find_by(id: self.attraction_id)
        if user && attraction 
            user.tickets > attraction.tickets 
        else 
            false
        end
    end

    def ride_taken
        user = User.find_by(id: self.user_id)
        attraction = Attraction.find_by(id: self.attraction_id)
        user.tickets = user.tickets - attraction.tickets 
        user.nausea = user.nausea + attraction.nausea_rating
        user.happiness = user.happiness + attraction.happiness_rating
        user.save
    end 

end
