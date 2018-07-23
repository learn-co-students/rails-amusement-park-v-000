class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if not_enough_tickets? && not_tall_enough?
      not_enough_tickets_message + " You are not tall enough to ride the #{self.attraction.name}."
    elsif not_enough_tickets?
      not_enough_tickets_message
    elsif not_tall_enough?
      not_tall_enough_message
    else
      self.user.tickets -= self.attraction.tickets
      self.user.nausea += self.attraction.nausea_rating
      self.user.happiness += self.attraction.happiness_rating
      self.user.save

    end


  end

  private

  def not_enough_tickets?
    self.attraction.tickets > self.user.tickets
  end

  def not_enough_tickets_message
    "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
  end

  def not_tall_enough?
    self.attraction.min_height > self.user.height
  end

  def not_tall_enough_message
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
  end

end
