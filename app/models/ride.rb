class Ride < ApplicationRecord
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if self.user.height >= self.attraction.min_height && self.user.tickets >= self.attraction.tickets
      new_tickets = self.user.tickets - self.attraction.tickets
      new_happiness = self.user.happiness + self.attraction.happiness_rating
      new_nausea = self.user.nausea + self.attraction.nausea_rating
      # binding.pry
      self.user.update(tickets: new_tickets, happiness: new_happiness, nausea: new_nausea)
      "Thanks for riding the #{attraction.name}!"
    elsif self.user.height < self.attraction.min_height && self.user.tickets < self.attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif self.user.height < self.attraction.min_height || self.user.tickets < self.attraction.tickets
      if self.user.tickets < self.attraction.tickets
        "Sorry. You do not have enough tickets to ride the #{attraction.name}."
      elsif self.user.height < self.attraction.min_height
        "Sorry. You are not tall enough to ride the #{attraction.name}."
      end
    end
  end

end
