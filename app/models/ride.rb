class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride

    if enough_tickets_for_ride? && tall_enough_for_ride?
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save

      success_message = "Thanks for riding the #{attraction.name}!"
      success_message
    else
      error_message
    end

  end

  def enough_tickets_for_ride?
    user.tickets > attraction.tickets
  end

  def tall_enough_for_ride?
    user.height > attraction.min_height
  end

  def error_message
    error_message = "Sorry."

    if user.tickets < attraction.tickets
      error_message << " You do not have enough tickets to ride the #{attraction.name}."
    end

    if user.height < attraction.min_height
      error_message << " You are not tall enough to ride the #{attraction.name}."
    end

    error_message
  end
end
