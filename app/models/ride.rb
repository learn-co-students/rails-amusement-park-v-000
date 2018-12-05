class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride

  end

  def meet_requirements
    enough_tickets, tall_enough = false
    if self.user.tickets >= self.attraction.tickets
      enough_tickets = true
    end
    if self.user.height >= self.attraction.min_height
      tall_enough = true
    end
    return [enough_tickets, tall_enough]
  end

  def start_ride
    
  end

  def ticket_issue
    "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
  end

  def height_issue
    "Sorry. You are not tall enough to ride the #{self.attraction.name}."
  end

end
