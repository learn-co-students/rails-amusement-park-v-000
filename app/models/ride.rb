class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if user.tickets >= attraction.tickets && user.height >= attraction.min_height
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
    else
      self.no_ride
    end
  end

  def no_ride
    if attraction.tickets >= user.tickets && attraction.min_height > user.height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif attraction.min_height > user.height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    end
  end
end
