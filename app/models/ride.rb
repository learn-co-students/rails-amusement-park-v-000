class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction


  def take_ride
    if !user_has_enough_tickets && !user_is_tall_enough
      "Sorry. " + not_enough_tickets + " " + not_tall_enough
    elsif !user_has_enough_tickets
      "Sorry. " + not_enough_tickets
    elsif !user_is_tall_enough
      "Sorry. " + not_tall_enough
    else
      start_ride
      "Thanks for riding the #{self.attraction.name}!"
    end
  end

  def user_has_enough_tickets
    user.tickets >= attraction.tickets
  end

  def user_is_tall_enough
    user.height >= attraction.min_height
  end

  def start_ride
    updated_happiness = user.happiness + attraction.happiness_rating
    updated_nausea = user.nausea + attraction.nausea_rating
    updated_ticket = user.tickets - attraction.tickets
    user.update(
      :happiness => updated_happiness,
      :nausea => updated_nausea, 
      :tickets => updated_ticket
    )

  end

  def not_enough_tickets
    "You do not have enough tickets to ride the #{attraction.name}."
  end

  def not_tall_enough
    "You are not tall enough to ride the #{attraction.name}."
  end


end
