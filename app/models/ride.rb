class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if not_enough_tickets? && not_tall_enough?
      # accounts for the user not being tall enough and not having enough tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif not_tall_enough?
      # accounts for the user not being tall enough
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif not_enough_tickets?
      # accounts for the user not having enough tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    else # updates the user's ticket number, the user's nausea & user's happiness
      self.user.update(tickets: remaining_tickets, nausea: new_nausea, happiness: new_happiness)
      self.save
      "Thanks for riding the #{self.attraction.name}!"
    end
  end

  def not_tall_enough?
    self.user.height < self.attraction.min_height
  end

  def not_enough_tickets?
    self.user.tickets < self.attraction.tickets
  end

  def remaining_tickets
    self.user.tickets -= self.attraction.tickets
  end

  def new_nausea
    self.user.nausea += self.attraction.nausea_rating
  end

  def new_happiness
     self.user.happiness += self.attraction.happiness_rating
  end
end
