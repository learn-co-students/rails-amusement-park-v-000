class Ride < ActiveRecord::Base
  
    belongs_to :user
    belongs_to :attraction

    def take_ride

      case
        when tall_enough && enough_tickets
            go_to_ride
        when !tall_enough && enough_tickets
            "Sorry. #{not_tall_enough}."
        when tall_enough && !enough_tickets
            "Sorry. #{not_enough_tickets}."
        else
            "Sorry. #{not_enough_tickets}. #{not_tall_enough}."
        end
    end

    def tall_enough
        self.user.height >= self.attraction.min_height ? true : false
    end

    def enough_tickets
        self.user.tickets >= self.attraction.tickets ? true : false
    end

    def go_to_ride

        new_happiness = self.user.happiness + self.attraction.happiness_rating
        new_nausea = self.user.nausea + self.attraction.nausea_rating
        new_tickets = self.user.tickets - self.attraction.tickets
        self.user.update(happiness: new_happiness, nausea: new_nausea, tickets: new_tickets)
        self.user.save
        "Thanks for riding the #{self.attraction.name}!"
    end

    def not_tall_enough
        "You are not tall enough to ride the #{self.attraction.name}"
    end

    def not_enough_tickets
        "You do not have enough tickets to ride the #{self.attraction.name}"
    end

end
