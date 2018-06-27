require 'pry'
class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if self.user.height < self.attraction.min_height && self.user.tickets < self.attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif self.user.height < self.attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif self.user.tickets < self.attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    else
      tickets = self.user.tickets - self.attraction.tickets
      nausea =  self.user.nausea + self.attraction.nausea_rating
      happiness = self.user.happiness + self.attraction.happiness_rating
      self.user.update(tickets: tickets, nausea: nausea, happiness: happiness)
      "Thanks for riding the #{self.attraction.name}!"
    end
  end
end
