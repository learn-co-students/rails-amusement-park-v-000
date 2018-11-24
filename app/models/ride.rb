class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction
   def take_ride
    if user.tickets < attraction.tickets && user.height <= attraction.min_height
      "Sorry. " + short_tickets + " " + too_short
    elsif user.tickets < attraction.tickets
      "Sorry. " + short_tickets
    elsif user.height <= attraction.min_height
      "Sorry. " + too_short
    else
      user.happiness = user.happiness + attraction.happiness_rating
      user.nausea = user.nausea + attraction.nausea_rating
      user.tickets = user.tickets - attraction.tickets
      user.save
      "Thanks for riding the #{attraction.name}!"
    end
  end
   def too_short
    "You are not tall enough to ride the #{attraction.name}."
  end
   def short_tickets
    "You do not have enough tickets to ride the #{attraction.name}."
  end

end
