class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if !self.user.tickets > self.attraction.tickets && !self.user.height > self.attraction.min_height
      p "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif !self.user.tickets > self.attraction.tickets
      p "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif !self.user.height > self.attraction.min_height
      p "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    end
  end

end
