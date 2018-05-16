class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if not_tall_enough && not_enough_tickets
      'Sorry. ' + tickets_message + ' ' +  height_message
    elsif not_tall_enough
      'Sorry. ' + height_message
    elsif not_enough_tickets
      'Sorry. ' + tickets_message
    else
      success
    end
  end

  def height_message
    "You are not tall enough to ride the #{attraction.name}."
  end

  def tickets_message
    "You do not have enough tickets to ride the #{attraction.name}."
  end

  def not_tall_enough
    user.height < attraction.min_height
  end

  def not_enough_tickets
    user.tickets < attraction.tickets
  end

  def success
    user.tickets -= attraction.tickets
    user.nausea += attraction.nausea_rating
    user.happiness += attraction.happiness_rating
    user.save
    "Thanks for riding the #{attraction.name}!"
  end
end
