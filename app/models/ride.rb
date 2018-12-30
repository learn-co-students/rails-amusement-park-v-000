require 'pry'
class Ride < ActiveRecord::Base

  belongs_to :attraction
  belongs_to :user



  def take_ride
    if ticket_check && height_check
      ride_taken
    elsif ticket_check && !height_check
      not_tall_enough
    elsif height_check && !ticket_check
      not_enough_tickets
    else
      not_tall_enough + not_enough_tickets
    end
  end

  def ride_taken
    self.user.update(tickets: self.user.tickets - self.attraction.tickets,
      happiness: self.user.happiness + self.attraction.happiness_rating,
    nausea: self.user.nausea + self.attraction.nausea_rating)
     "Thanks for riding the #{self.attraction.name}!"
  end

  def ticket_check
   self.user.tickets >= self.attraction.tickets
  end

  def height_check
    self.user.height >= self.attraction.min_height
  end

  def not_enough_tickets
    "You do not have enough tickets to ride the #{self.attraction.name}"
  end

  def not_tall_enough
    "You are not tall enough to ride the #{self.attraction.name}"
  end

end
