class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride

    if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    end

    if self.user.tickets > self.attraction.tickets
      self.user.update(:tickets => self.user.tickets - self.attraction.tickets)
      self.user.update(:nausea => self.user.nausea + self.attraction.nausea_rating)
      self.user.update(:happiness => self.user.happiness + self.attraction.happiness_rating)
    else
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    end

    if self.user.height > self.attraction.min_height
      self.user.height
    else
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
    end

  end

end
