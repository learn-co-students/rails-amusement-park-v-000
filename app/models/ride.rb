class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if attraction.tickets > user.tickets && attraction.min_height > user.height
      return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif attraction.tickets > user.tickets
      return  "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif attraction.min_height > user.height
      return "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
      return "Thanks for riding the #{self.attraction.name}!"
     end
    end
    
 end
