class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if not_enough_tickets && not_tall_enough
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif not_enough_tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif not_tall_enough
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      begin_ride
      "Thanks for riding the #{self.attraction.name}!"
    end
  end

  def not_enough_tickets
    self.attraction.tickets > self.user.tickets
  end

  def not_tall_enough
    self.attraction.min_height > self.user.height
  end

  def begin_ride
    self.user.update(tickets: self.user.tickets - self.attraction.tickets, nausea: self.user.nausea + self.attraction.nausea_rating, happiness: self.attraction.happiness_rating + self.user.happiness)
  end
end
