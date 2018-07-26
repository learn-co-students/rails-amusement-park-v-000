class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction


  def take_ride
    enough_tickets, tall_enough = meet_reqs

    if enough_tickets && tall_enough
      start_ride
    elsif !enough_tickets && tall_enough
       "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif enough_tickets && !tall_enough
      "Sorry. You are not tall enough to ride the Roller Coaster."
    else
      "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
    end
  end



  def start_ride
    new_happiness = self.user.happiness + self.attraction.happiness_rating
    new_nausea = self.user.nausea + self.attraction.nausea_rating
    new_tickets =  self.user.tickets - self.attraction.tickets

    self.user.update(
      happiness: new_happiness,
      nausea: new_nausea,
      tickets: new_tickets
    )
    "Thanks for riding the #{self.attraction.name}!"
  end




  #Requirements

  def meet_reqs
    enough_tickets, tall_enough = false

    if self.user.tickets >= self.attraction.tickets
      enough_tickets = true
    end

    if self.user.height >= self.attraction.min_height
      tall_enough = true
    end

    return [enough_tickets, tall_enough]
  end

end
