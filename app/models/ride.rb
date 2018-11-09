class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if user.tickets < attraction.tickets && user.height < attraction.min_height
          "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif user.tickets < attraction.tickets
          "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif user.height < attraction.min_height
          "Sorry. You are not tall enough to ride the #{attraction.name}."
        else
          user.happiness += attraction.happiness_rating
          user.nausea += attraction.nausea_rating
          user.tickets -= attraction.tickets
          user.save
          "Thanks for riding the #{attraction.name}!"
        end
    end
end