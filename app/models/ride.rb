class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    enough_tickets, tall_enough = meet_requirements
    if enough_tickets && tall_enough
      go_ride
    elsif tall_enough && !enough_tickets
      "Sorry. " + wrong_tickets
    elsif enough_tickets && !tall_enough
      "Sorry. " + wrong_height
    else
      "Sorry. " + wrong_tickets + " " + wrong_height
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
  def go_ride
    new_happiness = self.user.happiness + self.attraction.happiness_rating
    new_nausea = self.user.nausea + self. attraction.nausea_rating
    new_tickets = self.user.tickets - self.attraction.tickets
    self.user.update(
      :happiness => new_happiness,
      :nausea => new_nausea,
      :tickets => new_tickets
    )
    "Enjoy the #{self.attraction.name}"
  end
  def wrong_tickets
    "You do not have enough tickets to ride the #{attraction.name}."
  end
  def wrong_height
    "You are not tall enough to ride the #{attraction.name}."
  end

end
