class Ride < ActiveRecord::Base
  validates :user_id, presence: true
    validates :attraction_id, presence: true

    belongs_to :user
    belongs_to :attraction

    def take_ride
        if user_is_tall_enough? && user_has_enough_tickets?
            start_ride
        elsif !user_is_tall_enough? && user_has_enough_tickets?
            sorry_period + not_tall_enough
        elsif user_is_tall_enough? && !user_has_enough_tickets?
            sorry_period + not_enough_tickets
        else
            sorry_period + not_enough_tickets + " " + not_tall_enough
        end
    end

    private

    def sorry_period
        "Sorry. "
    end

    def user_is_tall_enough?
        user.height >= attraction.min_height ? true : false
    end

    def user_has_enough_tickets?
        user.tickets >= attraction.tickets ? true : false
    end

    def not_enough_tickets
        "You do not have enough tickets to ride the #{self.attraction.name}."
    end

    def not_tall_enough
        "You are not tall enough to ride the #{attraction.name}."
    end

    def start_ride
        user.nausea = user.nausea + attraction.nausea_rating
        user.happiness = user.happiness + attraction.happiness_rating
        user.tickets = user.tickets - attraction.tickets
        user.save
        "Thanks for riding the #{attraction.name}!"
    end 
end
