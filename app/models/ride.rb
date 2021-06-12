class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction


    def take_ride
   
        ride_hash = {}
       
        @user = self.user
        @attraction = self.attraction
        if @user.tickets < @attraction.tickets && @user.height < @attraction.min_height
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif @user.tickets < @attraction.tickets
              "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif @user.height < @attraction.min_height
              "Sorry. You are not tall enough to ride the #{attraction.name}."
        else #user takes ride
             @user.update(tickets: @user.tickets -= @attraction.tickets)
             @user.update(nausea: @user.nausea += @attraction.nausea_rating)
             @user.update(happiness: @user.happiness += @attraction.happiness_rating)
              
              return true
            
        end
    end
   
        
    
end
