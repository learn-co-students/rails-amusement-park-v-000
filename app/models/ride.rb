class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    attraction = self.attraction
    user = self.user
    if user.height < attraction.min_height && user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
    elsif attraction.tickets > user.tickets
      "Sorry. You do not have enough tickets to ride the Roller Coaster."
    elsif user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the Roller Coaster."
    else
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
    end
  end



end
