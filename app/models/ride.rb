class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :attraction
        

 def too_few
       
         self.attraction.tickets >= self.user.tickets
        #  binding.pry
 end
    def ticket_problem
             "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    end
      
    def too_short
     self.attraction.min_height >= self.user.height 
    
    end
    def height_problem
         "Sorry. You are not tall enough to ride the #{self.attraction.name}." 
    end
    def multiple_issues
         self.attraction.tickets >= self.user.tickets && self.attraction.height >= self.user.height
    end
    def multiple_problems
        "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    end

    def go_for_it
        self.user.tickets >= self.attraction.tickets && self.user.height >= self.attraction.min_height
    end
    
    def thank_you
        "Thanks for riding the #{self.attraction.name}!"
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
    

    def take_ride
    # ride = Ride.create(:user_id => user.id, :attraction_id => attraction.id)

    # ride.user_id = user.id
    if go_for_it
        update_feelings
        thank_you
    elsif too_short && too_few
        multiple_problems
    
    elsif too_short
       height_problem
    
    elsif too_few  
       ticket_problem
   end
 
#   binding.pry
    end
end
