class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if !enough_tickets && !tall_enough
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif !enough_tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif !tall_enough
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      user_updates
    end
  end

  def user_updates
    new_tickets = self.user.tickets - self.attraction.tickets
    new_happiness = self.user.happiness + self.attraction.happiness_rating
    new_nausea = self.user.nausea + self.attraction.nausea_rating

    self.user.update(tickets: new_tickets, happiness: new_happiness, nausea: new_nausea)

    "Thanks for riding the #{self.attraction.name}!"
  end

  def enough_tickets
    if self.user.tickets >= self.attraction.tickets
      true
    else
      false
    end
  end

  def tall_enough
    if self.user.height >= self.attraction.min_height
      true
    else
      false
    end
  end
end
