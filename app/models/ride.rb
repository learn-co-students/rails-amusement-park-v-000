class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    enough_tickets, tall_enough = meets_ride_requirements
    if enough_tickets && tall_enough
      ride_attraction
    elsif !enough_tickets && tall_enough
       "Sorry. " + not_enough_tickets
    elsif enough_tickets && !tall_enough
        "Sorry. " + not_tall_enough
    else
       "Sorry. " + not_enough_tickets + " " + not_tall_enough
    end
  end

  def meets_ride_requirements
    enough_tickets, tall_enough = false
    if self.user.tickets >= self.attraction.tickets
      enough_tickets = true
    end
    if self.user.height >= self.attraction.min_height
      tall_enough = true
    end
    return [enough_tickets, tall_enough]
  end

  def ride_attraction
    update_happiness = self.attraction.happiness_rating + self.user.happiness
    update_nausea = self.attraction.nausea_rating + self.user.nausea
    update_tickets = self.user.tickets - self.attraction.tickets
    self.user.update(:happiness => update_happiness, :nausea => update_nausea, :tickets => update_tickets)
     "Thanks for riding the #{self.attraction.name}!"
  end


  def not_enough_tickets
   "You do not have enough tickets to ride the #{attraction.name}."
  end

  def not_tall_enough
    "You are not tall enough to ride the #{attraction.name}."
  end

end
