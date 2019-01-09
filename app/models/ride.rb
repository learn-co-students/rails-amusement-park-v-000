class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        @user = User.find(user_id)
        @attraction = Attraction.find(attraction_id)
        errors = []               

        if @user.tickets > @attraction.tickets
            @user.update(
                tickets: @user.tickets - @attraction.tickets,
                nausea: @user.nausea + @attraction.nausea_rating,
                happiness: @user.happiness + @attraction.happiness_rating
                )
        else
            errors << "Sorry. You do not have enough tickets to ride the Roller Coaster."
        end
        if @user.height < @attraction.min_height            
            if errors.empty?
                errors << "Sorry. You are not tall enough to ride the Roller Coaster."
            else
                errors << "You are not tall enough to ride the Roller Coaster."
            end
        end        
        errors.join(" ")
    end
    
end

