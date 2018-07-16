class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction
  
  def take_ride
    prompt = []
    prompt << "You do not have enough tickets to ride the #{attraction.name}." if user.tickets < attraction.tickets
    prompt << "You are not tall enough to ride the #{attraction.name}." if user.height < attraction.min_height
    return "Sorry. " + prompt.join(" ") if prompt.present?

    user.update(
      tickets: user.tickets - attraction.tickets, 
      happiness: user.happiness + attraction.happiness_rating, 
      nausea: user.nausea + attraction.nausea_rating
    )
    "Thanks for riding the #{attraction.name}!"
  end
end
