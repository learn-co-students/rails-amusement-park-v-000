class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if not_enough_tickets && not_min_height
      return "#{not_enough_tickets_message} #{not_min_height_message}"
    end
    if not_enough_tickets
      return not_enough_tickets_message
    end
    if not_min_height
      return "Sorry. #{not_min_height_message}"
    end
    user.tickets -= attraction.tickets
    user.nausea += attraction.nausea_rating
    user.happiness += attraction.happiness_rating

    user.save
    return "Thanks for riding the #{attraction.name}!"
  end

  private

  def not_enough_tickets
    user.tickets < attraction.tickets
  end

  def not_min_height
    user.height < attraction.min_height
  end

  def not_min_height_message
    "You are not tall enough to ride the #{attraction.name}."
  end

  def not_enough_tickets_message
    "Sorry. You do not have enough tickets to ride the #{attraction.name}."
  end

end
