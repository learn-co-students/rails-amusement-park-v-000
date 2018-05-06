class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if user.tickets < attraction.tickets
      if user.height < attraction.min_height
        return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
      else
        return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
      end
    elsif user.height < attraction.min_height
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets > attraction.tickets
      user.update(tickets: user.tickets - attraction.tickets,
      nausea: user.nausea + attraction.nausea_rating, happiness: user.happiness + attraction.happiness_rating)
    end
  end




end
