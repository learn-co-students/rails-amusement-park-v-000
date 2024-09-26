class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride # can make it neater and remove self.
    if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif self.user.tickets < self.attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif self.user.height < self.attraction.min_height
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      self.user.nausea += self.attraction.nausea_rating
      self.user.happiness += self.attraction.happiness_rating
      self.user.tickets -= self.attraction.tickets

      self.user.save # important to save so it can reflect what happened
      "Thanks for riding the #{attraction.name}!"
    end
  end

end
