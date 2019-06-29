class Ride < ApplicationRecord

  belongs_to :attraction
  belongs_to :user

  def take_ride
    # binding.pry
    if (self.attraction.tickets > self.user.tickets) && (self.attraction.min_height > self.user.height)
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif self.attraction.tickets > self.user.tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif self.attraction.min_height > self.user.height
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else

      current_tickets = self.user.tickets - self.attraction.tickets
      current_nausea = self.user.nausea + self.attraction.nausea_rating
      current_happiness = self.user.happiness + self.attraction.happiness_rating

      self.user.update(tickets: current_tickets, nausea: current_nausea, happiness: current_happiness)
      "Thanks for riding the #{self.attraction.name}!"

    end
  end
end

# attraction.tickets > user.tickets &&
