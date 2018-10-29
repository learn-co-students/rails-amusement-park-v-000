class Ride < ActiveRecord::Base
    belongs_to :user 
    belongs_to :attraction 

    def take_ride 
        user_tickets = user_requirements
        user_height = user_requirements
      if user_tickets && user_height 
        begin_ride 
      elsif 
        !user_tickets && user_height 
        "Sorry partner, you broke AF"
      elsif 
        user_tickets && !user_height 
        "Sorry pip squeak, you blow"
      else 
        "Super Sorry, you suck doubly hard!" 
      end 
    end 

    def user_requirements
        user_tickets = true 
        user_height = true 
        if user.tickets < attraction.tickets 
            user_tickets = false
        end 

        if user.height < attraction.min_height
            user_height = false 
        end   

        return [user_tickets, user_height]
    end


        
    def begin_ride 
        updated_happiness = user.happiness + attraction.happiness_rating
        updated_nausea = user.nausea + attraction.nausea_rating
        updated_tickets = user.tickets + attraction.tickets 
        user.update(happiness: "updated_happiness",
        nausea: "updated_nausea",
        tickets: "updated_tickets")
    end
end
