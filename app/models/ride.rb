class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    enough_tickets, tall_enough = requirements
    if enough_tickets && tall_enough
      start_ride
    elsif !enough_tickets && tall_enough
      not_enough_tickets
    elsif enough_tickets && !tall_enough
      "Sorry. " + too_short
    else
      not_enough_tickets + " " + too_short
    end
  end

  def requirements
    if self.user.tickets >= self.attraction.tickets
      enough_tickets = true
    end

    if self.user.height >= self.attraction.min_height
      tall_enough = true
    end
      return [enough_tickets, tall_enough]
  end

  def start_ride
    new_happiness = self.user.happiness + self.attraction.happiness_rating
    new_nausea = self.user.nausea + self.attraction.nausea_rating
    new_tickets = self.user.tickets - self.attraction.tickets
    self.user.update(
      happiness:  new_happiness,
      nausea:  new_nausea,
      tickets:  new_tickets
    )
    "Thanks for riding the #{self.attraction.name}!"
  end

  def not_enough_tickets
    "Sorry. You do not have enough tickets to ride the #{attraction.name}."
  end

  def too_short
    "You are not tall enough to ride the #{attraction.name}."
  end
end
