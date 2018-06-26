class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if !enough_tickets? && !tall_enough?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !enough_tickets?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif !tall_enough?
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      update_user_attrs
      "Thanks for riding the #{attraction.name}!"
    end
  end

  def enough_tickets?
    user.tickets >= attraction.tickets
  end

  def tall_enough?
    user.height >= attraction.min_height
  end

  def update_user_attrs
    user.update(tickets: new_tix, nausea: new_nausea, happiness: new_happiness)
  end

  def new_tix
    user.tickets - attraction.tickets
  end

  def new_nausea
    user.nausea + attraction.nausea_rating
  end

  def new_happiness
    user.happiness + attraction.happiness_rating
  end



end
