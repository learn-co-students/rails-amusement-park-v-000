module RidesHelper
  def take_ride
    user = User.find_by(id: user_id)
    attraction = Ride.attraction
    if user[:tickets].to_i < attraction[:tickets].to_i && user[:height].to_i < attraction[:min_height].to_i
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
      elsif user[:tickets].to_i < attraction[:tickets].to_i
       "Sorry. You do not have enough tickets to ride the #{attraction.name}."
     elsif user[:height].to_i < attraction[:min_height].to_i
       "Sorry. You are not tall enough to ride the #{attraction.name}."
     else
       user.tickets = user[:tickets].to_i - attraction[:tickets].to_i
       user.nausea = user[:nausea].to_i + attraction[:nausea_rating].to_i
       user.happiness = user[:happiness].to_i + attraction[:happiness_rating].to_i
       user.save

    end
  end

end
