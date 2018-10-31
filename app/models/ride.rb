class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if !self.meet_requirements
      self.user.tickets -= self.attraction.tickets
      self.user.happiness += self.attraction.happiness_rating
      self.user.nausea += self.attraction.nausea_rating
      self.user.save
      "Thanks for riding the #{self.attraction.name}!"
    else
      self.meet_requirements
    end
  end

  def meet_requirements
    if self.height_requirement && self.ticket_requirement
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif self.height_requirement
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif self.ticket_requirement
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    else
      return false
    end
  end

  def height_requirement
    self.user.height < self.attraction.min_height
  end

  def ticket_requirement
    self.user.tickets < self.attraction.tickets
  end
end
