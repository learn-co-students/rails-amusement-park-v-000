require 'pry'
class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction

  def take_ride
    #binding.pry
    ride = self
    if ride.user.tickets < ride.attraction.tickets && ride.user.height < ride.attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{ride.attraction.name}. You are not tall enough to ride the #{ride.attraction.name}."
    elsif ride.user.tickets < ride.attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{ride.attraction.name}."
    elsif ride.user.height < ride.attraction.min_height
      "Sorry. You are not tall enough to ride the #{ride.attraction.name}."
    else
      n_tickets = ride.user.tickets - ride.attraction.tickets
      n_nausea = ride.user.nausea + ride.attraction.nausea_rating
      n_happ = ride.user.happiness + ride.attraction.happiness_rating
      user.update(tickets: n_tickets, nausea: n_nausea, happiness: n_happ)
    end
  end

end
