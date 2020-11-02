class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if user.tickets < attraction.tickets && user.height < attraction.min_height
      "Sorry. #{not_enough_tickets}. #{user_is_too_short}."
    elsif user.tickets < attraction.tickets
      "Sorry. #{not_enough_tickets}."
    elsif user.height < attraction.min_height
      "Sorry. #{user_is_too_short}."
    else
      # The user has enough tickets and is tall enough to ride the attraction.
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
      "Thanks for riding the #{attraction.name}!"
    end
  end

  def not_enough_tickets
    "You do not have enough tickets to ride the #{attraction.name}"
  end

  def user_is_too_short
    "You are not tall enough to ride the #{attraction.name}"
  end
end
