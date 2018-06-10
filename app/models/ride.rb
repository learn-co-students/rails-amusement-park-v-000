class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    # binding.pry
    if attraction.tickets > user.tickets && attraction.min_height > user.height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif attraction.tickets > user.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif attraction.min_height > user.height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      subtract_from_tickets = user.tickets - attraction.tickets
      add_to_nausea = user.nausea + attraction.nausea_rating
      add_to_happiness = user.happiness + attraction.happiness_rating
      user.update(tickets: subtract_from_tickets, nausea: add_to_nausea, happiness: add_to_happiness)
      "Thanks for riding the #{attraction.name}!"
    end
  end
end
