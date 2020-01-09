class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride #How does this method know what attraction and user are?  Where are we passing those variables?
    if attraction.tickets > user.tickets && attraction.min_height > user.height
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif attraction.tickets > user.tickets
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif
      attraction.min_height > user.height
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
    end
    new_number_of_tickets = user.tickets - attraction.tickets
    user.tickets = new_number_of_tickets
  end


end
