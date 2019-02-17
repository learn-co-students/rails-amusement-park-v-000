class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    user = self.user
    attraction = self.attraction
    if user.height >= attraction.min_height && user.tickets >= attraction.tickets
      tickets_left = user.tickets - attraction.tickets
      new_happy = user.happiness + attraction.happiness_rating
      new_nausea = user.nausea + attraction.nausea_rating
      user.update(happiness: new_happy, nausea: new_nausea, tickets: tickets_left)
      "Thanks for riding the #{attraction.name}!"
    elsif user.height < attraction.min_height && user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif  user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
  end
  end
end
