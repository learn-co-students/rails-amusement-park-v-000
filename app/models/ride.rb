require 'pry'

class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction


  def take_ride
    enough_tickets, tall_enough = meet_requirements
    if enough_tickets && tall_enough
      start_ride
      "Thanks for riding the #{self.attraction.name}!"
    elsif tall_enough && !enough_tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif enough_tickets && !tall_enough
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
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
    new_happiness = self.user.happiness + self.attraction.happiness_rating
    new_nausea = self.user.nausea + self.attraction.nausea_rating
    new_tickets =  self.user.tickets - self.attraction.tickets
    self.user.update(
      :happiness => new_happiness,
      :nausea => new_nausea,
      :tickets => new_tickets)
    "Thanks for riding the #{self.attraction.name}!"
  end

end




  #     attraction = self.attraction
  #     user = self.user
      # attraction_tickets = attraction.tickets
      # user_tickets = user.tickets

  #    if  attraction.tickets > user.tickets && attraction.min_height > user.height
  #   "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
  # elsif attraction.tickets > user.tickets
  #   "Sorry. You do not have enough tickets to ride the #{attraction.name}."
  # elsif attraction.min_height > user.height
  #   "Sorry. You are not tall enough to ride the #{attraction.name}."
  # else
  #   current_tickets = user.tickets - attraction.tickets
  #   current_nausea = user.nausea + attraction.nausea_rating
  #   current_happiness = user.happiness + attraction.happiness_rating

  #   user.update(tickets: current_tickets, nausea: current_nausea, happiness: current_happiness)
  # end

# end
