class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    
    def take_ride 
        if all_good  
            update_user_info      
        else           
            bad_ride 
        end 
    end

    def all_good
        enough_tickets && tall_enough
    end 

    def bad_ride
        if !enough_tickets 
                low_on_tickets_message
        elsif !tall_enough
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        else !enough_tickets && !tall_enough
                needs_more_tickets_and_height_message
        end
    end

   
    def enough_tickets
      if self.user && self.attraction
          if self.user.tickets >= self.attraction.tickets
            return enough_tickets = true
          end
        end
    end 

    def tall_enough
    
      if self.user && self.attraction
        tall_enough = self.user.height.to_i >= self.attraction.min_height.to_i
        # if self.user.height.to_i >= self.attraction.min_height.to_i
        #     return tall_enough = true
        # end
      end
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
        if self.user.tickets && self.attraction.tickets
            new_ticket_count = self.user.tickets.to_i - self.attraction.tickets.to_i
            new_nausea = self.user.nausea.to_i + self.attraction.nausea_rating.to_i 
            new_happiness = self.user.happiness.to_i + self.attraction.happiness_rating.to_i
            
            self.user.update(
                tickets: new_ticket_count, 
                happiness: new_happiness,
                nausea: new_nausea
                )
              
            puts "Thanks for riding the #{attraction.name}!"   
        end 

    end
end




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