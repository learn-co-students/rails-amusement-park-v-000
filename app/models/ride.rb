class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if !enough_tickets? && !tall_enough?
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif !tall_enough?
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif !enough_tickets?
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    else
      # enough_tickets? = true && tall_enough? = true
      update_tickets
      update_nausea_level
      update_happiness_level
      "Thanks for riding the #{self.attraction.name}!"
    end
  end

  def go_on_ride
      if have_enough_tickets? && tall_enough?
          remaining_tickets = user.tickets - attraction.tickets
          new_nausea_level = user.nausea + attraction.nausea_rating
          new_happiness_level = user.happiness + attraction.happiness_rating

          user.update(tickets: remaining_tickets, nausea: new_nausea_level, happiness: new_happiness_level)

      end
  end

  def update_tickets
    user.update(tickets: user.tickets - attraction.tickets)
  end

  def update_nausea_level
    user.update(nausea: user.nausea + attraction.nausea_rating)
  end

  def update_happiness_level
    user.update(happiness: user.happiness + attraction.happiness_rating)
  end

  def enough_tickets?
    user.tickets >= attraction.tickets
  end

  def tall_enough?
    user.height >= attraction.min_height
  end
end
