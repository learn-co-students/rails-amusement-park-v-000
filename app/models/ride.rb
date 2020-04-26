class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    user_has_enough_tickets, user_is_tall_enough = user_meets_requirements
    if user_has_enough_tickets && user_is_tall_enough
      start_ride
    elsif user_is_tall_enough && !user_has_enough_tickets
      "Sorry. " + not_enough_tickets
    elsif !user_is_tall_enough && user_has_enough_tickets
      "Sorry. " + not_tall_enough
    elsif !user_is_tall_enough && !user_has_enough_tickets
      "Sorry. " + not_enough_tickets + " " + not_tall_enough
    end
  end

  def user_meets_requirements
    user_has_enough_tickets, user_is_tall_enough = false
    if self.user.tickets >= self.attraction.tickets
      user_has_enough_tickets = true
    end
    if self.user.height >= self.attraction.min_height
      user_is_tall_enough = true
    end
    return [user_has_enough_tickets, user_is_tall_enough]
  end

  def start_ride
    new_happiness = self.user.happiness + self.attraction.happiness_rating
    new_nausea = self.user.nausea + self.attraction.nausea_rating
    new_ticket_count = self.user.tickets - self.attraction.tickets
    self.user.update(
      :happiness => new_happiness,
      :nausea => new_nausea,
      :tickets => new_ticket_count
    )
    "Thanks for riding the #{self.attraction.name}!"
  end

  def not_enough_tickets
    "You do not have enough tickets to ride the #{self.attraction.name}."
  end

  def not_tall_enough
    "You are not tall enough to ride the #{self.attraction.name}."
  end
end
