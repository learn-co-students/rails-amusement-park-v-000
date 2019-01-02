class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    user = User.find_by_id(user_id)
    attraction = Attraction.find_by_id(attraction_id)

    if user.tickets >= attraction.tickets && user.height >= attraction.min_height
      user.happiness = user.happiness += attraction.happiness_rating
      user.nausea = user.nausea += attraction.nausea_rating
      user.tickets  = user.tickets -= attraction.tickets
      user.save!
      "Thanks for riding the #{attraction.name}!"
    elsif user.height < attraction.min_height && user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif
      attraction.min_height > user.height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif
       attraction.tickets > user.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    end
  end

end
