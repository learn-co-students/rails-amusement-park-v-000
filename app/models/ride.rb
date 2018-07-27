class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if too_few_tickets? && too_short?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif too_few_tickets?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif too_short?
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      self.subtract_tickets
      self.add_nausea
    end
  end

  def subtract_tickets
    self.user.tickets -= self.attraction.tickets
    self.user.update(tickets: self.user.tickets)
  end

  def add_nausea
    self.user.nausea += self.user.nausea
    self.user.update(nausea: self.user.nausea)
  end

  def too_few_tickets?
    self.user.tickets < self.attraction.tickets
  end

  def too_short?
    self.user.height < self.attraction.min_height
  end



end
