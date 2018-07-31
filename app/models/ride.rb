class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    attraction = Attraction.find_by(id: attraction_id)
    user = User.find_by(id: user_id)
    phrase1 = "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    phrase2 = "Sorry. You are not tall enough to ride the #{attraction.name}."

    if user.height > attraction.min_height && user.tickets > attraction.tickets
      user.tickets -= attraction.tickets
      user.happiness += attraction.happiness_rating
      user.nausea += attraction.nausea_rating
      user.save
      "Thanks for riding the #{attraction.name}!"
    elsif user.height > attraction.min_height
      phrase1
    elsif user.tickets > attraction.tickets
      phrase2
    else
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    end
  end


end
