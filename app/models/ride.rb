class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    enough_tickets, tall_enough = meet_requirements
    if enough_tickets && tall_enough
      start_ride
    elsif !enough_tickets && tall_enough
      'Sorry. ' + tickets_issue
    elsif enough_tickets && !tall_enough
      'Sorry. ' + height_issue
    else
      'Sorry. ' + tickets_issue + ' ' + height_issue
    end
  end

  def meet_requirements
    enough_tickets, tall_enough = false
    if self.user.tickets >= self.attraction.tickets
      enough_tickets = true
    end

    if self.user.height >= self.attraction.min_height
      tall_enough = true
    end

    return [enough_tickets, tall_enough]
  end

  def start_ride
    user_happiness = self.user.happiness + self.attraction.happiness_rating
    user_nausea = self.user.nausea + self.attraction.nausea_rating
    user_tickets = self.user.tickets - self.attraction.tickets

    self.user.update(
      happiness: user_happiness,
      nausea: user_nausea,
      tickets: user_tickets
    )
    "Thanks for riding the #{self.attraction.name}!"
  end

  def tickets_issue
    "You do not have enough tickets to ride the #{self.attraction.name}."
  end

  def height_issue
    "You are not tall enough to ride the #{self.attraction.name}."
  end
end
