class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction


  def take_ride
    if
      self.user.tickets >= self.attraction.tickets && self.user.height >= self.attraction.min_height
        "Enjoy Your Ride"
          new_happiness = self.user.happiness + self.attraction.happiness_rating
          new_nausea = self.user.nausea + self.attraction.nausea_rating
          new_tickets =  self.user.tickets - self.attraction.tickets
          self.user.update(:happiness => new_happiness, :nausea => new_nausea, :tickets => new_tickets)
    elsif self.user.tickets < self.attraction.tickets && self.user.height >= self.attraction.min_height
        "Sorry. You do not have enough tickets to ride the Roller Coaster."
    elsif self.user.height < self.attraction.min_height && self.user.tickets >= self.attraction.tickets
        "Sorry. You are not tall enough to ride the Roller Coaster."
    else
      "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
    end
  end

  end
