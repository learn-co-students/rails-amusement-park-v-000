class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    ride_err = ""
    if self.user.tickets < self.attraction.tickets
      ride_err << " You do not have enough tickets to ride the #{attraction.name}."
    end
    if self.user.height < self.attraction.min_height
      ride_err << " You are not tall enough to ride the #{attraction.name}."
    end
    if ride_err.empty?
      self.user.tickets -= self.attraction.tickets
      self.user.happiness += self.attraction.happiness_rating
      self.user.nausea += self.attraction.nausea_rating
    else
      "Sorry." + ride_err
    end
  end
end
