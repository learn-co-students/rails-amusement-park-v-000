class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    @errors = []
    if self.user.tickets < self.attraction.tickets
      @errors << "You do not have enough tickets to ride the #{self.attraction.name}."
    end
    if self.user.height < self.attraction.min_height
      @errors << "You are not tall enough to ride the #{self.attraction.name}."
    end
    if @errors == []
      self.user.update(happiness: self.user.happiness + self.attraction.happiness_rating, nausea: self.user.nausea + self.attraction.nausea_rating, tickets: self.user.tickets - self.attraction.tickets)
      return nil
    else
      return "Sorry. #{@errors.join(' ')}"
    end
  end
end
