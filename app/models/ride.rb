class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction

  def take_ride

    user.update(tickets: user.tickets - attraction.tickets, nausea: user.nausea + attraction.nausea_rating, happiness: user.happiness + attraction.happiness_rating)

    if user.tickets < attraction.tickets && user.height < attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    end
  end
end
