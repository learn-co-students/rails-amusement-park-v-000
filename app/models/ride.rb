class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    # accounts for the user not having enough tickets & not being tall enough
    if !enough_tickets? && !tall_enough?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif
      # accounts for the user not having enough tickets
      !enough_tickets?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif
      # accounts for the user not being tall enough
      !tall_enough?
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      subtract_tickets
      update_nausea
      update_happiness
      "Thanks for riding the #{attraction.name}!"
    end
  end

  def enough_tickets?
    user.tickets >= attraction.tickets
  end

  def tall_enough?
    user.height >= attraction.min_height
  end

  def subtract_tickets
    user.update(tickets: user.tickets - attraction.tickets)
  end

  def update_nausea
    user.update(nausea: user.nausea + attraction.nausea_rating)
  end

  def update_happiness
    user.update(happiness: user.happiness + attraction.happiness_rating)
  end

end
