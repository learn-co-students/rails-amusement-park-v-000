class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if self.user.height > self.attraction.min_height && self.user.tickets > self.attraction.tickets
      self.user.tickets = self.user.tickets - self.attraction.tickets
      self.user.update(:nausea => self.user.nausea + self.attraction.nausea_rating, :happiness => self.user.happiness + self.attraction.happiness_rating)
    elsif self.user.height < self.attraction.min_height && self.user.tickets < self.attraction.tickets
      "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
    elsif self.user.height < self.attraction.min_height && self.user.tickets > self.attraction.tickets
      "Sorry. You are not tall enough to ride the Roller Coaster."
    elsif self.user.height > self.attraction.min_height && self.user.tickets < self.attraction.tickets
      "Sorry. You do not have enough tickets to ride the Roller Coaster."
    end
  end
  
end
