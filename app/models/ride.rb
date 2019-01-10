class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        @user = User.find(user_id)
        @attraction = Attraction.find(attraction_id)
        errors = ["Sorry."]               


        if @user.tickets < @attraction.tickets && @user.height < @attraction.min_height
            errors << "You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
        elsif @user.tickets < @attraction.tickets
            errors << "You do not have enough tickets to ride the #{@attraction.name}."
        elsif @user.height < @attraction.min_height          
            errors << "You are not tall enough to ride the #{@attraction.name}."
        else @user.tickets > @attraction.tickets
            @user.update(
                tickets: @user.tickets - @attraction.tickets,
                nausea: @user.nausea + @attraction.nausea_rating,
                happiness: @user.happiness + @attraction.happiness_rating
                )             
        end        
        errors.join(" ")
    end
    
end

