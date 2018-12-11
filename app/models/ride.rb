class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    ride = self
    short_tickets = " You do not have enough tickets to ride the Roller Coaster."
    short_height = " You are not tall enough to ride the Roller Coaster."
    
    if ride.user.tickets < ride.attraction.tickets && ride.user.height < ride.attraction.min_height
      "Sorry." + short_tickets + short_height
    elsif ride.user.tickets < ride.attraction.tickets
      "Sorry." + short_tickets
    elsif ride.user.height < ride.attraction.min_height
      "Sorry." + short_height
    else
      user = ride.user
      user.tickets = user.tickets - ride.attraction.tickets
      user.nausea = user.nausea + ride.attraction.nausea_rating
      user.happiness = user.happiness + ride.attraction.happiness_rating
      user.save
    end
  end
end
