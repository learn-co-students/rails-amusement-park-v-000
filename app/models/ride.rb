class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        result = ["Sorry."]
        if attraction.tickets > user.tickets
          result << "You do not have enough tickets to ride the #{attraction.name}."
        end
        if attraction.min_height > user.height
          result << "You are not tall enough to ride the #{attraction.name}."
        end
        if result.count > 1
          result.join(' ')
        else
          user.tickets -= attraction.tickets
          user.nausea += attraction.nausea_rating
          user.happiness += attraction.happiness_rating
          user.save
          "Thanks for riding the #{attraction.name}!"
        end
      end




end
