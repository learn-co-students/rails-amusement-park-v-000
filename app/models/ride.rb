class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    msg = []
    msg << "You do not have enough tickets to ride the #{attraction.name}." if self.user.tickets < self.attraction.tickets
    msg << "You are not tall enough to ride the #{attraction.name}." if self.user.height < self.attraction.min_height


    if !msg.empty?
      msg.unshift("Sorry.")
      return msg.join(' ')
    else
      u = self.user
      a = self.attraction
      u.update(tickets: (u.tickets - a.tickets), happiness: (u.happiness + a.happiness_rating), nausea: (u.nausea + a.nausea_rating))
      return "Thanks for riding the #{a.name}!"
    end
  end
end
