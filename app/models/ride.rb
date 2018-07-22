class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction
    
    def take_ride
        if (nuff_tix? && tall_nuf?)
            update_user
        else
            res="Sorry."
            res<< " You do not have enough tickets to ride the Roller Coaster." if !nuff_tix?
            res<< " You are not tall enough to ride the Roller Coaster." if !tall_nuf?
            res
        end
    end
    
    
    def update_user
        user=self.user
        att=self.attraction
        user.happiness+=att.happiness_rating
        user.nausea+=att.nausea_rating
        user.tickets-=att.tickets
        user.save #!Woops! Forgot to save this guy...
    end
    
    def nuff_tix?
        self.user.tickets>=self.attraction.tickets
    end
    
    def tall_nuf?
        self.user.height>=self.attraction.min_height
    end
end
