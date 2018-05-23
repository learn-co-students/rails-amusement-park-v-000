# require 'pry'
class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if enough_tickets? && tall_enough?
      user.tickets = user.tickets - attraction.tickets
      user.nausea = user.nausea + attraction.nausea_rating
      user.happiness = user.happiness + attraction.happiness_rating
      user.save
    elsif !enough_tickets? && !tall_enough?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !enough_tickets?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    else
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    end
  end

  def enough_tickets?
    user.tickets > attraction.tickets ? true : false
  end

  def tall_enough?
    user.height > attraction.min_height ? true : false
  end
end
#
# 3) Ride has a method 'take_ride' that accounts for the user not having enough tickets
#
#
#   44) Ride has a method 'take_ride' that accounts for the user not being tall enough
#
#
#   45) Ride has a method 'take_ride' that accounts for the user not being tall enough and not having enough tickets
#
#
#   46) Ride has a method 'take_ride' that updates ticket number
#
#
#   47) Ride has a method 'take_ride' that updates the user's nausea
#
#
#   48) Ride has a method 'take_ride' that updates the user's happiness
