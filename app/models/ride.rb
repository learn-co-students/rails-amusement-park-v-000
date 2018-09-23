class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    user = self.user
    attraction = self.attraction
    user_tickets = user.tickets
    attraction_tickets = attraction.tickets
    if user_tickets < attraction_tickets && user.height < attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user_tickets < attraction_tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      update_tickets = user_tickets - attraction_tickets
      update_nausea = user.nausea + attraction.nausea_rating
      update_happiness = user.happiness + attraction.happiness_rating
      user.update(tickets: update_tickets, happiness: update_happiness, nausea: update_nausea)

      "Thanks for riding the #{attraction.name}!"
     end
   end
 end
