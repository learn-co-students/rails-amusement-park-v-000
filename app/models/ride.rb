class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if not_enough_tickets? && not_tall_enough?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif not_enough_tickets?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif not_tall_enough?
      "Sorry. You are not tall enough to ride the #{attraction.name}." 
    else
      start_ride
      "Thanks for riding the #{attraction.name}!"
    end
    
  end
 
  private

  def not_enough_tickets?
    user.tickets < attraction.tickets
  end

  def not_tall_enough?
    user.height < attraction.min_height
  end

  def start_ride
    new_tickets = self.user.tickets - self.attraction.tickets
    new_nausea = user.nausea + attraction.nausea_rating
    new_happiness = user.happiness + attraction.happiness_rating
    self.user.update(
      tickets: new_tickets,
      nausea: new_nausea,
      happiness: new_happiness
    )
  end

end
