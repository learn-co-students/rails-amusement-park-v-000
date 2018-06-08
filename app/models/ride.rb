class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if not_enough_tickets? && too_short?
      "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
    elsif not_enough_tickets?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif too_short?
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      update_user
      "Thanks for riding the #{attraction.name}!"
    end
  end

  def not_enough_tickets?
    user.tickets < attraction.tickets
  end

  def too_short?
    user.height < attraction.min_height
  end

  def update_user
    user.update(happiness: user.happiness += attraction.happiness_rating)
    user.update(nausea: user.nausea += attraction.nausea_rating)
    user.update(tickets: user.tickets -= attraction.tickets)
  end

end
