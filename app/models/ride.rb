class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    user = self.user
    attraction = self.attraction
    if user.height < attraction.min_height && user.tickets < attraction.tickets
      return "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
    elsif user.height < attraction.min_height
      return "Sorry. You are not tall enough to ride the Roller Coaster."
    elsif user.tickets < attraction.tickets
      return "Sorry. You do not have enough tickets to ride the Roller Coaster."
    else
      user.tickets -= attraction.tickets
      user.happiness += attraction.happiness_rating
      user.nausea += attraction.nausea_rating
      user.save
    end
  end
end
