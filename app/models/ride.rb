class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

   def take_ride
    if enough_tickets && !tall_enough
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif !enough_tickets && tall_enough
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif !enough_tickets && !tall_enough
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."

     else
      self.user.update(tickets: update_tickets, nausea: update_nausea, happiness: update_happiness)
      "Thanks for riding the #{self.attraction.name}!"
    end
  end

   private
  def enough_tickets
    self.user.tickets >= self.attraction.tickets
  end

   def tall_enough
    self.user.height >= self.attraction.min_height
  end
  def update_tickets
    self.user.tickets - self.attraction.tickets
  end

   def update_nausea
    self.user.nausea + self.attraction.nausea_rating
  end

   def update_happiness
    self.user.happiness + self.attraction.happiness_rating
  end
end
