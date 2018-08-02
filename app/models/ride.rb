class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if !tall_enough? && !enough_tickets?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !tall_enough?
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif !enough_tickets?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    else
      ride_the_thing
    end
  end

  def ride_the_thing
    user.happiness += attraction.happiness_rating
    user.nausea += attraction.nausea_rating
    user.tickets -= attraction.tickets
    user.save
    "Thanks for riding the #{self.attraction.name}!"
  end

  def tall_enough?
    user.height >= attraction.min_height ? true : false
  end

  def enough_tickets?
    user.tickets >= attraction.tickets ? true : false
  end

end
