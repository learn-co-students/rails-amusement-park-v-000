class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        @user = User.find(self.user_id)
        @attraction = Attraction.find(self.attraction_id)
        if @user.height < @attraction.min_height && @user.tickets < @attraction.tickets
            return "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
        end
        if @user.tickets < @attraction.tickets
            return "Sorry. You do not have enough tickets to ride the Roller Coaster."
        else
            @user.tickets -= @attraction.tickets
        end
        if @user.height < @attraction.min_height
            return "Sorry. You are not tall enough to ride the Roller Coaster."
        end
        @user.nausea += @attraction.nausea_rating
        @user.happiness += @attraction.happiness_rating
        @user.save
    end
end
