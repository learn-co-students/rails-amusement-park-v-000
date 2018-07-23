class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    error = ""
    if !enough_tickets?
      error += " You do not have enough tickets to ride the #{self.attraction.name}."
    end

    if !tall_enough?
      error += " You are not tall enough to ride the #{self.attraction.name}."
    end
    if !error.strip!
      self.user.update(tickets: ticket_change, nausea: nausea_change, happiness: happiness_change)
      final_message = "Thanks for riding the #{self.attraction.name}!"
    else
      final_message = "Sorry. " + error

    end
    final_message
  end

  def enough_tickets?
    self.user.tickets >= self.attraction.tickets ? true : false
  end

  def tall_enough?
    self.user.height >= self.attraction.min_height ? true : false
  end

  def ticket_change
    self.user.tickets -= self.attraction.tickets
  end

  def nausea_change
    self.user.nausea += self.attraction.nausea_rating
  end

  def happiness_change
    self.user.happiness += self.attraction.happiness_rating
  end
end
