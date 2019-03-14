class Ride < ActiveRecord::Base
belongs_to :attraction
belongs_to :user


    def take_ride
        if enough_tickets? && height_requirement?
            update_attributes
            "Thanks for riding the #{self.attraction.name}!"
        elsif !enough_tickets? && height_requirement?
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif enough_tickets? && !height_requirement?
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        elsif !enough_tickets? && !height_requirement?
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        else
            "Somethink Funky"
        end

    end


private 

    def enough_tickets?
         self.attraction.tickets <= self.user.tickets
    end

    def height_requirement?
         self.attraction.min_height <= self.user.height
    end

    def update_attributes
        self.user.update(
            tickets: self.user.tickets - self.attraction.tickets,
            nausea: self.attraction.nausea_rating + self.user.nausea,
            happiness: self.attraction.happiness_rating + self.user.happiness
        )
    end


end
