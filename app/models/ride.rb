class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction
  validates_presence_of :user_id, :attraction_id

  def take_ride
    if self.attraction.tickets > self.user.tickets && self.attraction.min_height > user.height
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif self.attraction.tickets > self.user.tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif self.attraction.min_height > self.user.height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif self.attraction.tickets <= self.user.tickets && self.attraction.min_height <= self.user.height
      user.update(tickets: self.user.tickets - self.attraction.tickets)
      user.update(nausea: self.user.nausea + self.attraction.nausea_rating)
      user.update(happiness: self.user.happiness + self.attraction.happiness_rating)
      "Thanks for riding the #{attraction.name}!"
    end
  end


end
