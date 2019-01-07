class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    ride_err = ""
    if user.tickets < attraction.tickets
      ride_err << " You do not have enough tickets to ride the #{attraction.name}."
    end
    if user.height < attraction.min_height
      ride_err << " You are not tall enough to ride the #{attraction.name}."
    end
    if ride_err.empty?
      user.tickets = user.tickets - attraction.tickets
      user.happiness = user.happiness + attraction.happiness_rating
      user.nausea = user.nausea + attraction.nausea_rating
      user.update
    else
      "Sorry." + ride_err
    end
  end
end
