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
        "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
      elsif 
        user_tickets && !user_height 
        "Sorry. You are not tall enough to ride the #{self.attraction.name}."
      else 
        "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
      end 
    end 

    def user_requirements
        user_tickets = true 
        user_height = true 
        if self.user.tickets <= self.attraction.tickets 
            user_tickets = false
        end 

        if self.user.height <= self.attraction.min_height
            user_height = false 
        end   

        return [user_tickets, user_height]
    end


        
    def begin_ride 
        updated_happiness = self.user.happiness + self.attraction.happiness_rating
        updated_nausea = self.user.nausea + self.attraction.nausea_rating
        updated_tickets = self.user.tickets - self.attraction.tickets 
        self.user.update(happiness: "updated_happiness",
        nausea: "updated_nausea",
        tickets: "updated_tickets")
   
        "Thanks for riding the #{self.attraction.name}!"

    end
end
