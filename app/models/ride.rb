class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user 

def take_ride
    if !user_has_enough_tickets? && user_is_tall_enough?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif user_has_enough_tickets? && !user_is_tall_enough? 
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif !user_has_enough_tickets? && !user_is_tall_enough?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    else 
      start_ride
    end    
  end

  def start_ride 
    new_tickets = self.user.tickets - self.attraction.tickets 
    new_nausea = self.user.nausea + self.attraction.nausea_rating 
    new_happiness = self.user.happiness + self.attraction.happiness_rating

    self.user.update(tickets: new_tickets, nausea: new_nausea, happiness: new_happiness)

    "Thanks for riding the #{self.attraction.name}!"
  end  

  def user_has_enough_tickets?
    (self.user.tickets >= self.attraction.tickets) 
  end 
  
  def user_is_tall_enough?
    self.user.height >= self.attraction.min_height
  end 

  end   
