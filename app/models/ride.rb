class Ride < ActiveRecord::Base

  belongs_to :user
  belongs_to :attraction

  def take_ride
    if
      !self.sufficient_tickets && !self.sufficient_height
        "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the #{self.attraction.name}."
      elsif
        !self.sufficient_height
          "Sorry. You are not tall enough to ride the #{self.attraction.name}."
      elsif
        !self.sufficient_tickets
          "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
      else
        self.update_tickets
        self.update_nausea
        self.update_happiness
        "Thanks for riding the #{self.attraction.name}!"
    end
  end

  def sufficient_tickets
    user.tickets >= attraction.tickets
  end

  def sufficient_height
    user.height >= attraction.min_height
  end

  def update_tickets
    new_tickets = self.user.tickets - self.attraction.tickets
    self.user.update(tickets: new_tickets)
  end

  def update_nausea
    new_nausea = self.user.nausea + self.attraction.nausea_rating
    self.user.update(nausea: new_nausea)
  end

  def update_happiness
    new_happiness = self.user.happiness + self.attraction.happiness_rating
    self.user.update(happiness: new_happiness)
  end

end
