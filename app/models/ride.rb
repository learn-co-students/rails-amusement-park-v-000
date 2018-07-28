class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    attraction = self.attraction
    user = self.user
    if self.tickets && self.height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif self.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif self.height
       "Sorry. You are not tall enough to ride the #{attraction.name}."
     else
       user.tickets -= attraction.tickets
       user.nausea += attraction.nausea_rating
       user.happiness += attraction.happiness_rating
       user.save
    end
  end

  def tickets
   self.attraction.tickets > self.user.tickets
  end

  def height
     self.user.height < self.attraction.min_height
  end


end
