class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user
  
  def take_ride
    if not_tall_enough && not_enough_tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif not_tall_enough
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif not_enough_tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    else
      self.user.tickets -= self.attraction.tickets
      self.user.nausea += self.attraction.nausea_rating
      self.user.happiness += self.attraction.happiness_rating
      self.user.save
    end
  end
  
  def not_tall_enough
    self.user.height < self.attraction.min_height
  end
  
  def not_enough_tickets
    self.user.tickets < self.attraction.tickets
  end
  
end
