class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif self.user.height < self.attraction.min_height
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif self.user.tickets < self.attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    else
      new_ticket_amount = self.user.tickets - self.attraction.tickets
      new_nausea = self.user.nausea + self.attraction.nausea_rating
      new_happy = self.user.happiness + self.attraction.happiness_rating
      self.user.update(tickets: new_ticket_amount, nausea: new_nausea, happiness: new_happy)
      "Thanks for riding the #{self.attraction.name}!"
    end
  end
end
