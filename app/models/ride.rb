class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction 

    def take_ride 

        @user = User.find_by(id: self.user.id)
        @attraction = Attraction.find_by(id: self.attraction.id)

        if @user.tickets < @attraction.tickets && @user.height < @attraction.min_height 
             "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
            elsif @user.tickets < @attraction.tickets 
                 "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
            elsif @user.height < @attraction.min_height
                
                  "Sorry. You are not tall enough to ride the #{@attraction.name}."
            else 
                go_on_a_ride
                  "Thanks for riding the #{self.attraction.name}"
            end 
    end 

    def go_on_a_ride 
        self.user.update(:tickets => (self.user.tickets - self.attraction.tickets),
        :happiness => (self.user.happiness + self.attraction.happiness_rating),
        :nausea => (self.user.nausea + self.attraction.nausea_rating)
        )
    end 
end
