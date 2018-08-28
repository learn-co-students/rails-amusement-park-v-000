class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    u = User.find(self.user_id)
    return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}." if self.user.height < self.attraction.min_height && self.user.tickets < self.attraction.tickets
    return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}." if self.user.tickets < self.attraction.tickets
    return "Sorry. You are not tall enough to ride the #{self.attraction.name}." if self.user.height < self.attraction.min_height
    # updates ticket number
    u.update(tickets: u.tickets -= self.attraction.tickets)
    # updates user's nausea
    u.update(nausea: u.nausea += self.attraction.nausea_rating)
    # updates user's happiness
    u.update(happiness: u.happiness += self.attraction.happiness_rating)

    u.save

  end

end
