require 'pry'
class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction


  def enough_tickets?
    user.tickets >= attraction.tickets ? true : false
  end

  def tall_enough?
    user.height >= attraction.min_height ? true : false
  end

  def ticket_message
    "You do not have enough tickets to ride the #{attraction.name}."
  end

  def height_message
    "You are not tall enough to ride the #{attraction.name}."
  end

  def thank_you
    "Thanks for riding the #{attraction.name}! "
  end

  def take_ride
    if enough_tickets? && tall_enough?
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
      thank_you
    elsif enough_tickets? && !tall_enough?
      "Sorry. #{height_message}"
    elsif tall_enough? && !enough_tickets?
      "Sorry. #{ticket_message}"
    else
      "Sorry. #{ticket_message} #{height_message}"
    end
  end

end
