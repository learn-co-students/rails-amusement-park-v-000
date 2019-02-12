class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if insufficient_tickets? && too_short?
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif insufficient_tickets?
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif too_short?
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      update_tickets
      update_nausea
      update_happiness
      "Thanks for riding the #{self.attraction.name}!"
    end
  end

  def insufficient_tickets?
    self.user.tickets < self.attraction.tickets
  end

  def too_short?
    self.user.height < self.attraction.min_height
  end

  def update_tickets
    user = self.user
    user.tickets = user.tickets - self.attraction.tickets
    user.save
  end

  def update_nausea
    user = self.user
    user.nausea = user.nausea + self.attraction.nausea_rating
    user.save
  end

  def update_happiness
    user = self.user
    user.happiness = user.happiness + self.attraction.happiness_rating
    user.save
  end

end
