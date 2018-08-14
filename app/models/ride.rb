class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    attraction = Attraction.find(self.attraction_id)
    user = User.find(self.user_id)
    if user.tickets < attraction.tickets && user.height < attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      user_tickets = user.tickets - attraction.tickets
      user_nausea = user.nausea + attraction.nausea_rating
      user_happiness = user.happiness + attraction.happiness_rating
      user.update(tickets: user_tickets, nausea: user_nausea, happiness: user_happiness)
      "Thanks for riding the #{attraction.name}!"
    end
  end

end
