class Ride < ApplicationRecord
  belongs_to :attraction
  belongs_to :user


  # ride has a user and an attraction
  # tickets - enough?
  # height - enough?
  # happiness - increase
  # nausea - increase

  def user_tickets
    self.user.tickets
  end

  def attraction_tickets
    self.attraction.tickets
  end

  def enough_tickets?
    if user_tickets >= attraction_tickets
      return true
    else
      return false
    end
  end

  def tall_enough?
    if self.user.height >= self.attraction.min_height
      return true
    else
      return false
    end
  end

  def allowed_to_ride?
    if enough_tickets? && tall_enough?
      return true
    else
      return false
    end
  end

  def sorry_message
    if !tall_enough? && !enough_tickets?
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif tall_enough? && !enough_tickets?
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    else
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    end
  end

  def take_ride
    if allowed_to_ride?
      new_happiness = self.user.happiness += self.attraction.happiness_rating
      new_nausea = self.user.nausea += self.attraction.nausea_rating
      new_tickets = user_tickets - attraction_tickets
      self.user.update(
        happiness: new_happiness,
        tickets: new_tickets,
        nausea: new_nausea
      )
      return "Thanks for riding the #{self.attraction.name}!"
    else
      sorry_message
    end
  end
end
