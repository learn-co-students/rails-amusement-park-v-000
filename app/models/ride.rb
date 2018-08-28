class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    user = User.find_by(id: self.user_id)
    attraction = Attraction.find_by(id: self.attraction_id)
    if not_enough_tickets && not_tall_enough
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif not_enough_tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif not_tall_enough
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      user.update(tickets: user.tickets - attraction.tickets)
      user.update(nausea: user.nausea + attraction.nausea_rating)
      user.update(happiness: user.happiness + attraction.happiness_rating)
      "Thanks for riding the #{attraction.name}!"
    end
  end

  def not_enough_tickets
    self.user.tickets < self.attraction.tickets
  end

  def not_tall_enough
    self.user.height < self.attraction.min_height
  end
end
