class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif self.user.tickets < self.attraction.tickets 
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif self.user.height < self.attraction.min_height
      "Sorry. You are not tall enough to ride the Roller Coaster."
    else 
      self.user.nausea = self.user.nausea + self.attraction.nausea_rating  
      self.user.tickets = self.user.tickets - self.attraction.tickets 
      self.user.happiness = self.user.happiness + self.attraction.happiness_rating
      self.user.save 
    end
  end

  
end
