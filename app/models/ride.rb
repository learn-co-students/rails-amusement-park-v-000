class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction


  def tall_enough?
    rider = User.find(user_id)
    attraction = Attraction.find(attraction_id)

    rider.height > attraction.min_height
  end

  def enough_tickets?
    rider = User.find(user_id)
    attraction = Attraction.find(attraction_id)

    rider.tickets > attraction.tickets
  end

  def take_ride
    rider = User.find(user_id)
    attraction = Attraction.find(attraction_id)

    #TODO: Abstract this logic
    if !enough_tickets? && !tall_enough?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !enough_tickets?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif !tall_enough?
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      rider.tickets = rider.tickets - attraction.tickets
      rider.happiness = rider.happiness + attraction.happiness_rating
      rider.nausea = rider.nausea + attraction.nausea_rating

      rider.save
    end


  end
end
