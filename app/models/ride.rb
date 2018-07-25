class Ride < ActiveRecord::Base
  include UsersHelper

  belongs_to :attraction
  belongs_to :user

  def take_ride
    if enough_tickets? && tall_enough?
      new_tickets = self.user.tickets - self.attraction.tickets
      new_nausea = self.user.nausea + self.attraction.nausea_rating
      new_happiness = self.user.happiness + self.attraction.happiness_rating
      self.user.update(:tickets => new_tickets, :nausea => new_nausea, :happiness => new_happiness)
      @message = "Thanks for riding the #{self.attraction.name}!"
    elsif !tall_enough? && !enough_tickets?
      @message = "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif !tall_enough?
      @message = "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      @message = "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    end
  end

  def enough_tickets?
    if self.user.tickets > self.attraction.tickets
      return true
    else
      return false
    end
  end

  def tall_enough?
    if self.user.height < self.attraction.min_height
      return false
    else
      return true
    end
  end

end
