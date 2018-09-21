class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride

        if !self.tall_enough? && !self.enough_tickets?
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif  !self.tall_enough?
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        elsif !self.enough_tickets?
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        else
            self.user.update(:tickets => self.deduct_tickets)
            self.user.update(:nausea => self.update_nausea)
            self.user.update(:happiness => self.update_happiness)

            "Thanks for riding the #{self.attraction.name}!"
        end
    end

    def deduct_tickets
        self.user.tickets - self.attraction.tickets
    end

    def update_nausea
        self.user.nausea + self.attraction.nausea_rating
    end

    def update_happiness
        self.user.happiness + self.attraction.happiness_rating
    end

    def tall_enough?
        self.user.height < self.attraction.min_height ? false : true
    end

    def enough_tickets?
        self.user.tickets < self.attraction.tickets ? false : true
    end

end
