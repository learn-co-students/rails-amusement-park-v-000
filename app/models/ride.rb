class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if !enough_tickets && !tall_enough
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif !tall_enough
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        elsif !enough_tickets 
            # binding.pry
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        else
            @user = self.user
            @attraction = self.attraction
            
            @user.tickets -= @attraction.tickets
            @user.nausea += @attraction.nausea_rating
            @user.happiness += @attraction.happiness_rating
            # binding.pry
            @user.save
            "Thanks for riding the #{attraction.name}!"
        end
    end 

    def enough_tickets
        self.user.tickets >= self.attraction.tickets
    end

    def tall_enough 
        self.user.height >= self.attraction.min_height
    end
end
