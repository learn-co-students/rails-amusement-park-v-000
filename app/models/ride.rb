class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if tall_enough? && enough_tickets?
      valid_ride
    elsif
      !tall_enough? && !enough_tickets?
      height_and_tix_msg
    elsif !tall_enough?
      height_msg
    elsif !enough_tickets?
      tix_msg
    end
  end

  def valid_ride
    user.tickets -= attraction.tickets
    user.nausea += attraction.nausea_rating
    user.happiness += attraction.happiness_rating
    user.save
    "Thanks for riding the #{attraction.name}!"
  end

  def height_and_tix_msg
    "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
  end

  def height_msg
    text = "Sorry. You are not tall enough to ride the #{attraction.name}."
  end

  def tix_msg
    "Sorry. You do not have enough tickets to ride the #{attraction.name}."
  end

  def tall_enough?
    user.height >= attraction.min_height
  end

  def enough_tickets?
    user.tickets >= attraction.tickets
  end

end
