class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    meets_tickets, meets_height = meets_requirements
    if meets_tickets && meets_height
      ride_ride
    elsif meets_height && !meets_tickets
      "Sorry. " + ticket_problem
    elsif !meets_height && meets_tickets
      "Sorry. " + height_problem
    else
      "Sorry. " + ticket_problem + " " + height_problem
    end
  end

  def meets_requirements
    if self.user.tickets >= self.attraction.tickets
      meets_tickets = true
    else
      meets_tickets = false
    end
    if self.user.height >= self.attraction.min_height
      meets_height = true
    else
      meets_height = false
    end
    return [meets_tickets, meets_height]
  end

  def ride_ride
    user = User.find_by(id: self.user_id)
    attraction = Attraction.find_by(id: self.attraction_id)

    user.update(happiness: user.happiness + attraction.happiness_rating)
    user.update(nausea: user.nausea + attraction.nausea_rating)
    user.update(tickets: user.tickets - attraction.tickets)

    "Thank you for riding the #{self.attraction.name}!"
  end

  def ticket_problem
    "You do not have enough tickets to ride the #{self.attraction.name}."
  end

  def height_problem
    "You are not tall enough to ride the #{self.attraction.name}."
  end
end
