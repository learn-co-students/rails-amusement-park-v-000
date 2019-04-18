class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    # binding.pry
    if (self.user.height < self.attraction.min_height) && (self.user.tickets < self.attraction.tickets)
      # binding.pry
      "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
    elsif self.user.height < self.attraction.min_height
      "Sorry. You are not tall enough to ride the Roller Coaster."
    elsif self.user.tickets < self.attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    else
      # binding.pry

      # self.user.tickets = (self.user.tickets - self.attraction.tickets)
      # self.user.save
      self.user.update(:tickets => (self.user.tickets - self.attraction.tickets))

      self.user.update(:nausea => (self.user.nausea + self.attraction.nausea_rating))

      self.user.update(:happiness => (self.user.happiness + self.attraction.happiness_rating))

      
    end
  end
end
