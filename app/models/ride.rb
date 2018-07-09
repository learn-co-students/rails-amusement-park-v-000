class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if self.attraction.tickets > self.user.tickets && self.attraction.min_height > self.user.height
      "Sorry. You do not have enough tickets for the #{self.attraction.name}. Sorry. You are not tall enought to ride the #{self.attraction.name}."
    elsif self.attraction.tickets > self.user.tickets
      "Sorry. You do not have enough tickets for the #{self.attraction.name}."
    elsif self.attraction.min_height > self.user.height
      "Sorry. You are not tall enought to ride the #{self.attraction.name}."
    else
      self.user.update(tickets: self.user.tickets - self.attraction.tickets)
    end
  end
end
