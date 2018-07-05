class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if allowed_on_ride
      went_on_ride
    elsif !enough_tickets && tall_enough
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif enough_tickets && !tall_enough
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    end

  end

  def enough_tickets
    self.user.tickets >= self.attraction.tickets
  end

  def tall_enough
    return true if user.height >= attraction.min_height
  end

  def allowed_on_ride
    return true if enough_tickets && tall_enough
  end

  def went_on_ride
    self.user.update(happiness: self.user.happiness + self.attraction.happiness_rating,
    tickets: self.user.tickets - self.attraction.tickets,
    nausea: self.user.nausea + self.attraction.nausea_rating)
    "Thanks for riding the #{self.attraction.name}!"
  end
end
