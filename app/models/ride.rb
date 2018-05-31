class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    validates :user_id, :attraction_id, presence: true

    def take_ride  
      if problem
        if not_enough_tickets && not_tall_enough
          needs_more_tickets_and_height_message
        elsif not_enough_tickets
          low_on_tickets_message
        elsif not_tall_enough
          height_error_message
        end
      else
        update_user_info
      end 
    end 

    def problem
        not_enough_tickets || not_tall_enough
    end   
    
    def not_enough_tickets
        self.user.tickets <= self.attraction.tickets
    end 

    def not_tall_enough
      self.user.height < self.attraction.min_height
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
        new_nausea_count = self.user.nausea + self.attraction.nausea_rating
        new_happiness = self.user.happiness + self.attraction.happiness_rating
        
        user.update(
            tickets: new_ticket_count, 
            happiness: new_happiness,
            nausea: new_nausea_count
            )
    end
end

