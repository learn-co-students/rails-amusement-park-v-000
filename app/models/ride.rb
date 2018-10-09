class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if enough_tickets? && tall_enough?
      self.user.tickets -= self.attraction.tickets
      self.user.nausea += self.attraction.nausea_rating
      self.user.happiness += self.attraction.happiness_rating
      self.user.save
      "Sorry. #{meets_ride_requirements}"
    elsif !enough_tickets? && tall_enough?
      "Sorry. #{not_enough_tickets}"
    elsif enough_tickets? && !tall_enough?
      "Sorry. #{not_tall_enough}"
    else
      "Sorry. #{not_enough_tickets} #{not_tall_enough}"
    end
  end

  def enough_tickets?
    self.attraction.tickets < user.tickets
  end

  def tall_enough?
    self.attraction.min_height <= user.height
  end

  def not_enough_tickets
    "You do not have enough tickets to ride the #{self.attraction.name}."
  end

  def not_tall_enough
    "You are not tall enough to ride the #{self.attraction.name}."
  end

  def meets_ride_requirements
    "Thanks for riding the #{self.attraction.name}!"
  end

end
