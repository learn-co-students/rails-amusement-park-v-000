class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :attraction
        

 def too_few
       
         "self.attraction.tickets".to_f >= "self.user.tickets".to_f 
        #  binding.pry
 end
    def ticket_problem
             "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    end
      
    def too_short
     "self.attraction.min_height".to_f >= "self.user.height".to_f 
    
    end
    def height_problem
         "Sorry. You are not tall enough to ride the #{self.attraction.name}." 
    end
    def multiple_issues
         "self.attraction.tickets".to_f >= "self.user.tickets".to_f && "self.attraction.height".to_f >= "self.user.height".to_f
    end
    def multiple_problems
        "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    end

    def go_for_it
        "self.user.tickets".to_f >= "self.attraction.tickets".to_f && "self.user.height".to_f >= "self.attraction.min_height".to_f
    end
    
    def thank_you
        "Thank you for riding."
    end
            
        
    def update_feelings
    new_happiness = self.user.happiness + self.attraction.happiness_rating
    new_nausea = self.user.nausea + self.attraction.nausea_rating
    new_tickets =  self.user.tickets - self.attraction.tickets
    self.user.update(
      :happiness => new_happiness,
      :nausea => new_nausea,
      :tickets => new_tickets
    )
    end
    
    # def go_on_ride
    #   if go_for_it
    #          update_feelings
    #          thank_you
    #      end
        
    # end

    def take_ride
    ride = Ride.create(:user_id => user.id, :attraction_id => attraction.id)

    ride.user_id = user.id
         if go_for_it
              update_feelings
        #      thank_you
 
        end
          if too_short && !too_few
            height_problem
    
      end
       if too_few  && !too_short
              ticket_problem
          end
             if too_short && too_few
            multiple_problems
   end
#   binding.pry
      

     end
end
