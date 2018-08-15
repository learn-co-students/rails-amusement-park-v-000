class Ride < ApplicationRecord
  belongs_to :attraction
  belongs_to :user

  def take_ride
    user = User.find_by_id(user_id)
    attraction = Attraction.find_by_id(attraction_id)
    if user.tickets < attraction.tickets && user.height >= attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif user.height < attraction.min_height && user.tickets >= attraction.tickets
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets && user.height < attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    else
      user.tickets = user.tickets - attraction.tickets
      user.nausea = user.nausea + attraction.nausea_rating
      user.happiness = user.happiness + attraction.happiness_rating
      user.save
      "Thanks for riding the #{attraction.name}!"
    end
  end

end
