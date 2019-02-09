class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        ride_val = nil
        if self.attraction.min_height > self.user.height &&
        self.attraction.tickets > self.user.tickets
            ride_val = "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        elsif self.attraction.min_height > self.user.height
            ride_val = "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        elsif self.attraction.tickets > self.user.tickets
            ride_val = "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        else
            ride_val = "Thanks for riding the #{self.attraction.name}!"
            self.user.tickets = self.user.tickets - self.attraction.tickets
            self.user.happiness = self.user.happiness + self.attraction.happiness_rating
            self.user.nausea = self.user.nausea + self.attraction.nausea_rating
            self.user.save
        end
        ride_val
    end
end
