require 'pry'
class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  # validates :user_id, presence: true
  # validates :attraction_id, presence: true

  def take_ride
    if self.too_poor_and_short?
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif self.too_short?
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif self.too_poor?
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    else
       start_ride
    end
  end

  def too_poor?
    self.user.tickets < self.attraction.tickets
  end

  def too_short?
    self.user.height < self.attraction.min_height
  end

  def too_poor_and_short?
    self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
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
  end

end
