class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction

  def take_ride
    return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}." if user.tickets < attraction.tickets && user.height < attraction.min_height
    return "Sorry. You do not have enough tickets to ride the #{attraction.name}." if user.tickets < attraction.tickets
    return "Sorry. You are not tall enough to ride the #{attraction.name}." if user.height < attraction.min_height

    user.update(tickets: user.tickets - attraction.tickets, nausea: user.nausea + attraction.nausea_rating, happiness: user.happiness + attraction.happiness_rating)
  end
end
