class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if self.user.height < self.attraction.min_height && self.user.tickets < self.attraction.tickets
      "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
    elsif self.user.height < self.attraction.min_height
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif self.user.tickets < self.attraction.tickets
      "Sorry. You do not have enough tickets to ride the Roller Coaster."
    else
      self.user.update(
        tickets: self.user.tickets - self.attraction.tickets,
        happiness: self.user.happiness + self.attraction.happiness_rating,
        nausea: self.user.nausea + self.attraction.nausea_rating
      )
    end
  end

  def mood

  end
  
end
