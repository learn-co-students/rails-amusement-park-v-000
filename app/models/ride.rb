class Ride < ActiveRecord::Base

  belongs_to :user
  belongs_to :attraction

  def take_ride
    user = User.find(user_id)
    attraction = Attraction.find(attraction_id)
    error = "Sorry."
    error.tap {
    error << " You do not have enough tickets to ride the #{attraction.name}." if attraction.tickets > user.tickets
    error << " You are not tall enough to ride the #{attraction.name}." if attraction.min_height > user.height
    if error == "Sorry."
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
    end
    }
  end
end
