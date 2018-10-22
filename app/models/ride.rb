class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    user_update if valid_rider else requirement
  end

  def requirement
    if user.tickets < attraction.tickets && user.height < attraction.min_height
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif
      user.tickets < attraction.tickets
        return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif 
      user.height < attraction.min_height
        return "Sorry. You are not tall enough to ride the #{attraction.name}."
    end
  end

  def valid_rider
    user.tickets >= attraction.tickets && user.height >= attraction.min_height
  end

  def user_update
    tickets = user.tickets - attraction.tickets
    nausea = user.nausea + attraction.nausea_rating
    happiness = user.happiness + attraction.happiness_rating
    user.update(tickets: tickets, nausea: nausea, happiness: happiness)
  end
  
end


