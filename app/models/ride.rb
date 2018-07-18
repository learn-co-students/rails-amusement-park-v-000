class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user
  validates :user_id, presence: true
  validates :attraction_id, presence: true

  def take_ride
    #condition for user not having enough tickets
    if !enough_tickets? && !tall_enough?
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !enough_tickets?
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif !tall_enough?
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      start_ride
    end
  end

  def start_ride
    new_happiness = self.user.happiness + self.attraction.happiness_rating
    new_nausea = self.user.nausea + self.attraction.nausea_rating
    new_tickets =  self.user.tickets - self.attraction.tickets
    self.user.update(
      :happiness => new_happiness,
      :nausea => new_nausea,
      :tickets => new_tickets
    )
    "Thanks for riding the #{self.attraction.name}!"
  end

  def tall_enough?
    self.user.height > self.attraction.min_height
  end

  def enough_tickets?
    self.user.tickets > self.attraction.tickets
  end
end
