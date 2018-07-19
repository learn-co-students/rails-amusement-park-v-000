class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction

  def take_ride
    has_enough_tickets = self.user.tickets > self.attraction.tickets
    has_enough_height = self.user.height > self.attraction.min_height

    if !has_enough_height && !has_enough_tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !has_enough_tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif !has_enough_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      self.user.tickets -= self.attraction.tickets
      self.user.happiness += self.attraction.happiness_rating
      self.user.nausea += self.attraction.nausea_rating
      self.user.save
      "Thanks for riding the #{self.attraction.name}!"
    end
  end

end
