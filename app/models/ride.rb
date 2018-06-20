class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    user = self.user
    attraction = self.attraction
    if user.height.to_i < attraction.min_height.to_i && user.tickets.to_i < attraction.tickets.to_i
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.height.to_i < attraction.min_height.to_i
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets.to_i < attraction.tickets.to_i
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    else
      user.tickets -= attraction.tickets
      user.happiness += attraction.happiness_rating
      user.nausea += attraction.nausea_rating
      user.save
      "Thanks for riding the #{attraction.name}!"
    end
  end
end
