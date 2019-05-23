class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if have_enough_tickets? && is_tall_enough?
      remaining_tickets = user.tickets - attraction.tickets
      new_nausea_level = user.nausea + attraction.nausea_rating
      new_happiness_level = user.happiness + attraction.happiness_rating

      user.update(tickets: remaining_tickets, nausea: new_nausea_level, happiness: new_happiness_level)
      "Thanks for riding the #{attraction.name}!"
    else
      if !have_enough_tickets? && !is_tall_enough?
        "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
      elsif !have_enough_tickets?
        "Sorry. You do not have enough tickets to ride the #{attraction.name}."
      else !is_tall_enough?
        "Sorry. You are not tall enough to ride the #{attraction.name}."
      end
    end
  end

  def have_enough_tickets?
    user.tickets >= attraction.tickets
  end

  def is_tall_enough?
    user.height >= attraction.min_height
  end

end
