class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if tall_enough && enough_tickets
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save

      "Thanks for riding the #{attraction.name}!"
    else
      error_message = "Sorry."
      error_message << " You do not have enough tickets to ride the #{attraction.name}." if !enough_tickets
      error_message << " You are not tall enough to ride the #{attraction.name}." if !tall_enough
      
      error_message
    end
  end

  def tall_enough
    user.height >= attraction.min_height
  end

  def enough_tickets
    user.tickets >= attraction.tickets
  end
end
