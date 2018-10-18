class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  validates :user, presence: true
  validates :attraction, presence: true

  def take_ride
    if enough_tickets && tall_enough
      start_ride
      "Thanks for riding the #{@ride.name}!"
    elsif !enough_tickets && tall_enough
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif enough_tickets && !tall_enough
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    end
  end

  def enough_tickets
    self.user.tickets >= self.attraction.tickets ? true : false
  end

  def tall_enough
    self.user.height >= self.attraction.min_height ? true : false
  end

  def start_ride
    self.user.tickets -= self.attraction.tickets
    self.user.happiness += self.attraction.happiness_rating
    self.user.nausea += self.attraction.nausea_rating
    self.user.save
  end

end
