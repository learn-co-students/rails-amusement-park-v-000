class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    user = User.find_by_id(self.user_id)
    attraction = Attraction.find_by_id(self.attraction_id)

    if (user.tickets < attraction.tickets) && (user.height < attraction.min_height)
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      start
    end
  end

  def start
    rider = self.user
    rider.happiness += self.attraction.happiness_rating
    rider.nausea += self.attraction.nausea_rating
    rider.tickets -= self.attraction.tickets
    rider.save
    "Thanks for riding the #{self.attraction.name}!"
  end 

end