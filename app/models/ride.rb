class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        if self.attraction.tickets <= self.user.tickets && self.attraction.min_height <= self.user.height
            new_attr
            "Thanks for riding the #{self.attraction.name}!"
        elsif self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif self.user.tickets < self.attraction.tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif self.user.height < self.attraction.min_height
            "Sorry. You are not tall enough to ride the #{attraction.name}."
  
        end
    end

    def new_attr
        self.user.update(
            tickets: self.user.tickets - self.attraction.tickets,
            nausea: self.attraction.nausea_rating + self.user.nausea,
            happiness: self.attraction.happiness_rating + self.user.happiness
        )
    end

end
