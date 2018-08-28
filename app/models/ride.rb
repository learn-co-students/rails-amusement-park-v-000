class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    # updates ticket number
    self.user.update(tickets: self.user.tickets -= self.attraction.tickets)
    # updates user's nausea
    self.user.update(nausea: self.user.nausea += self.attraction.nausea_rating)
    # updates user's happiness
    self.user.update(happiness: self.user.happiness += self.attraction.happiness_rating)
    self.user.save
    return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}." if self.user.height < self.attraction.min_height && self.user.tickets < self.attraction.tickets
    return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}." if self.user.tickets < self.attraction.tickets
    return "Sorry. You are not tall enough to ride the #{self.attraction.name}." if self.user.height < self.attraction.min_height
  end

end
