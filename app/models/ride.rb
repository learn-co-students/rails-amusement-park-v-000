class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction



  def take_ride 
    if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height 
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the Roller Coaster."
      
    elsif self.user.tickets < self.attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
      
    elsif 
      self.user.height < self.attraction.min_height
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
      
    else 
      self.ride 
    end
  end

  def ride 
    happiness = self.user.happiness + self.attraction.happiness_rating
    nausea = self.user.nausea + self.attraction.nausea_rating
    ticket_count = self.user.tickets - self.attraction.tickets 

    self.user.update(happiness: happiness, nausea: nausea, tickets: ticket_count) 

    "Thanks for riding the #{self.attraction.name}!"


  end

end
