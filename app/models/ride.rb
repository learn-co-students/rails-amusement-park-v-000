class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction

  def take_ride
    ticket, height = requirements

    if !ticket && height
      notice[0]
    elsif ticket && !height
      notice[1]
    elsif !ticket && !height
      notice.join.gsub(".Sorry.", ".")
    else
      accept_rider
    end
  end

  def accept_rider
    tickets = self.user.tickets - self.attraction.tickets

    nausea = self.user.nausea + self.attraction.nausea_rating

    happiness = self.user.happiness + self.attraction.happiness_rating

    self.user.update(
      tickets: tickets,
      nausea: nausea,
      happiness: happiness
    )
  end

  def requirements
    ticket, height = false

    if self.user.tickets >= self.attraction.tickets
      ticket = true
    end

    if self.user.height >= self.attraction.min_height
      height = true
    end

    [ticket, height]
  end

  def notice
    [
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}.",
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    ]
  end
end
