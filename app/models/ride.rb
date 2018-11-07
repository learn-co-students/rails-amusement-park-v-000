class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if not_enough_tickets && not_tall_enough
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif not_enough_tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif not_tall_enough
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      user.tickets = user.tickets - attraction.tickets
      user.nausea = user.nausea + attraction.nausea_rating
      user.happiness = user.happiness + attraction.happiness_rating
      user.save
    end
  end

  def not_tall_enough
    user.height < attraction.min_height ? true : false
  end

  def not_enough_tickets
    user.tickets < attraction.tickets ? true : false
  end
end
