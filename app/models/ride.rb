class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if tickets_require && height_require
      ride_require_met
      "Thanks for riding the #{self.attraction.name}!"
    elsif !tickets_require && height_require
      enough_tickets
    elsif tickets_require && !height_require
      tall_enough
    else
      enough_tickets + " " + tall_enough.remove("Sorry. ")
    end
  end

  def ride_require_met
    total_happiness = self.user.happiness + self.attraction.happiness_rating
    total_nausea = self.user.nausea + self.attraction.nausea_rating
    total_tickets = self.user.tickets - self.attraction.tickets
    self.user.update(
      :happiness => total_happiness,
      :nausea => total_nausea,
      :tickets => total_tickets
    )
  end

  def tickets_require
    self.user.tickets >= self.attraction.tickets ? true : false
  end

  def enough_tickets
    "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
  end

  def height_require
    self.user.height >= self.attraction.min_height ? true : false
  end

  def tall_enough
    "Sorry. You are not tall enough to ride the #{self.attraction.name}."
  end
end
