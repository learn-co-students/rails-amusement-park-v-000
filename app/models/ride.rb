class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if enough_tickets? && tall_enough?
      ride_ride
    else
      error_message = ""
      if !enough_tickets?
        error_message << " You do not have enough tickets to ride the #{self.attraction.name}."
      end
      if !tall_enough?
        error_message << " You are not tall enough to ride the #{self.attraction.name}."
      end

      "Sorry." + error_message
    end
  end

  private

  def enough_tickets?
    self.user.tickets >= self.attraction.tickets
  end

  def tall_enough?
    self.user.height >= self.attraction.min_height
  end

  def ride_ride
    self.user.tickets -= self.attraction.tickets
    self.user.nausea += self.attraction.nausea_rating
    self.user.happiness += self.attraction.happiness_rating
    self.user.save
    
    "Thanks for riding the #{self.attraction.name}!"
  end

end
