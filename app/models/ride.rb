class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction


  def take_ride
    #checks for height and tickets
      if user.tickets <= attraction.tickets && user.height <= attraction.min_height
        not_enough_tickets + ' ' + not_tall_enough
      elsif user.tickets <= attraction.tickets
        not_enough_tickets
      elsif user.height <= attraction.min_height
        'Sorry. ' +  not_tall_enough
      else
        #Updates tickets and mood
        user.update(
            tickets: user.tickets - attraction.tickets,
            happiness: user.happiness + attraction.happiness_rating,
            nausea: user.nausea + attraction.nausea_rating)
    end
  end

  def not_enough_tickets
    "Sorry. You do not have enough tickets to ride the #{attraction.name}."
  end

  def not_tall_enough
    "You are not tall enough to ride the #{attraction.name}."
  end


end
