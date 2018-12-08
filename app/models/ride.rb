require "pry"

class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    user = User.find(user_id)
    attraction = Attraction.find(attraction_id)
    if user.tickets >= attraction.tickets && user.height >= attraction.min_height
      user.happiness = user.happiness += attraction.happiness_rating
      user.nausea = user.nausea += attraction.nausea_rating
      user.tickets = user.tickets -= attraction.tickets
      user.save!
    elsif user.tickets < attraction.tickets && user.height < attraction.min_height
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    else user.height < attraction.min_height
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
    end
  end

end # class Ride
