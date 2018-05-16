class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if not_enough_tickets && !not_tall_enough
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif not_tall_enough && !not_enough_tickets
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif not_enough_tickets && not_tall_enough
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    else
      get_on_ride
    end
  end

  def get_on_ride
    new_happiness = self.user.happiness + self.attraction.happiness_rating
    new_nausea = self.user.nausea + self.attraction.nausea_rating
    new_tickets_number = self.user.tickets - self.attraction.tickets

    self.user.update(
      happiness: new_happiness, 
      nausea: new_nausea, 
      tickets: new_tickets_number)
      "Thanks for riding the #{attraction.name}!"
  end

  def not_enough_tickets
    self.user.tickets < self.attraction.tickets
  end

  def not_tall_enough
    self.user.height < self.attraction.min_height
  end
end
