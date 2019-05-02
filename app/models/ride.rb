
class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if not_enough_tickets && not_tall_enough
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif not_enough_tickets
       "Sorry. You do not have enough tickets to ride the #{attraction.name}."
     elsif not_tall_enough
       "Sorry. You are not tall enough to ride the #{attraction.name}."
     else
    new_tickets = user.tickets -= attraction.tickets
    new_nausea = user.nausea += attraction.nausea_rating
    new_happiness = user.happiness + attraction.happiness_rating
    User.update(tickets: new_tickets, nausea: new_nausea, happiness: new_happiness)
    end
  end

  def not_enough_tickets
    user.tickets < attraction.tickets
  end

  def not_tall_enough
    user.height < attraction.min_height
  end

end
