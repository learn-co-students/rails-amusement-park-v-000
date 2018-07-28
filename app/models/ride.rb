class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif self.user.tickets < self.attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif self.user.height < self.attraction.min_height
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      ticket_update = self.user.tickets - self.attraction.tickets
      nausea_update = self.user.nausea + self.attraction.nausea_rating
      happiness_update = self.user.happiness + self.attraction.happiness_rating
      self.user.update(tickets: ticket_update, nausea: nausea_update, happiness: happiness_update)
      "Thanks for riding the #{self.attraction.name}!"
    end
  end
end
