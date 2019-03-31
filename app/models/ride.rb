class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    valid_for_tickets = user.tickets >= attraction.tickets
    valid_for_height = user.height >= attraction.min_height
    
    new_ticket_count = user.tickets - attraction.tickets
    new_nausea_count = user.nausea + attraction.nausea_rating
    new_happiness_count = user.happiness + attraction.happiness_rating

    if !valid_for_tickets && !valid_for_height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !valid_for_tickets 
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif !valid_for_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      user.update(tickets: new_ticket_count, nausea: new_nausea_count, happiness: new_happiness_count)
      "Thanks for riding the #{attraction.name}!"
    end
  end 
end