class Ride < ActiveRecord::Base

  belongs_to :user
  belongs_to :attraction

  def take_ride
    if enough_tickets? && tall_enough?
      start_ride
    elsif enough_tickets? && !tall_enough?
      "Sorry. " + height_issue
    elsif tall_enough? && !enough_tickets?
      "Sorry. " + ticket_issue
    else
      "Sorry. " + ticket_issue + " " + height_issue
    end
  end

  def enough_tickets?
    self.user.tickets >= self.attraction.tickets
  end

  def tall_enough?
    self.user.height >= self.attraction.min_height
  end

  def start_ride
    new_tickets = self.user.tickets - self.attraction.tickets
    new_happiness = self.user.happiness + self.attraction.happiness_rating
    new_nausea = self.user.nausea + self.attraction.nausea_rating
    self.user.update(
      :tickets => new_tickets,
      :happiness => new_happiness,
      :nausea => new_nausea
    )
  end

  def height_issue
    "You are not tall enough to ride the #{self.attraction.name}."
  end

  def ticket_issue
    "You do not have enough tickets to ride the #{self.attraction.name}."
  end

end
