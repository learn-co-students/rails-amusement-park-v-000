class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if tall_enough? && enough_tix?
      update_user
      valid_ride_msg
    elsif
      !tall_enough? && !enough_tix?
      "Sorry. " + tix_msg + " " + height_msg
    elsif
      !tall_enough?
      "Sorry. " + height_msg
    elsif
      !enough_tix?
      "Sorry. " + tix_msg
    end
  end

  def update_user
    user.tickets = user.tickets -= attraction.tickets
    user.nausea += attraction.nausea_rating
    user.happiness += attraction.happiness_rating
    user.save
  end

  def valid_ride_msg
    "Thanks for riding the #{attraction.name}!"
  end

  def height_msg
    "You are not tall enough to ride the #{attraction.name}."
  end

  def tix_msg
    "You do not have enough tickets to ride the #{attraction.name}."
  end

  def tall_enough?
    user.height > attraction.min_height
  end

  def enough_tix?
    user.tickets > attraction.tickets
  end
end
