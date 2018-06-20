class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user


  def take_ride
    if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif self.user.height < self.attraction.min_height
       "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif self.user.tickets < self.attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    else
      tickets_remove = self.user.tickets -= self.attraction.tickets
      nausea_adjust = self.user.nausea += self.attraction.nausea_rating
      happiness_adjust = self.user.happiness += self.attraction.happiness_rating

      self.user.update(:tickets => tickets_remove, :nausea => nausea_adjust, :happiness => happiness_adjust)
      "Thanks for riding the #{self.attraction.name}!"
    end
  end
end
