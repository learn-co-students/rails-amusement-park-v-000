class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    
    def take_ride 
        if enough_tickets && tall_enough 
            update_user_info 
            "Thanks for riding the #{self.attraction.name}!"     
        else           
            bad_ride 
        end 
    end


    def bad_ride
        
        if !enough_tickets && !tall_enough
                needs_more_tickets_and_height_message
        elsif !enough_tickets 
            low_on_tickets_message
        elsif !tall_enough
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        end
    end

   
    def enough_tickets
      if self.user.tickets >= self.attraction.tickets
        return enough_tickets = true
      end
  
    end 

    def tall_enough
        tall_enough = self.user.height >= self.attraction.min_height
    end
    

    def height_error_message
       "Sorry. You are not tall enough to ride the #{attraction.name}."
    end

    def low_on_tickets_message
         "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    end 

    def needs_more_tickets_and_height_message
        "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    end

    def update_user_info
        new_ticket_count = self.user.tickets - self.attraction.tickets
        new_nausea = self.user.nausea + self.attraction.nausea_rating
        new_happiness = self.user.happiness + self.attraction.happiness_rating            
        self.user.update(
            tickets: new_ticket_count, 
            happiness: new_happiness,
            nausea: new_nausea
            )
    end
end


# if @ride.save
#             flash[:message] = "Thanks for riding the #{@ride.attraction.name}!"  
#         else 
#             if !tall_enough 
#                 flash[:message] =  "Sorry. You are not tall enough to ride the #{@ride.attraction.name}."
#             else !enough_tickets
#                  flash[:message] = "Sorry. You do not have enough tickets to ride the #{@ride.attraction.name}."
#             end
#         end   

    # def take_ride  
    #     if not_enough_tickets && not_tall_enough
    #       needs_more_tickets_and_height_message
    #     elsif not_enough_tickets
    #       low_on_tickets_message
    #     elsif not_tall_enough
    #       height_error_message
    #     else
    #       update_user_info
    #     end 
    # end