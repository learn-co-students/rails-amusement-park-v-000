class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if enough_tickets && tall_enough
      start_ride
    elsif !enough_tickets && !tall_enough
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !enough_tickets && tall_enough
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    else !tall_enough && enough_tickets
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    end
  end

  def start_ride
    user.update(
      :tickets => user.tickets - attraction.tickets,
      :nausea => user.nausea + attraction.nausea_rating,
      :happiness => user.happiness + attraction.happiness_rating
    )
    "Thanks for riding the #{attraction.name}!"
  end

  def tall_enough
    user.height >= attraction.min_height ? true : false
  end

  def enough_tickets
    user.tickets >= attraction.tickets ? true : false
  end
end
