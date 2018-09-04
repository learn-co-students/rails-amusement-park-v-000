class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if enough_tickets? && tall_enough?
      update_user
      "Thanks for riding the #{self.attraction.name}!"
    elsif !enough_tickets? && !tall_enough?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !enough_tickets?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif !tall_enough?
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    end
  end

  def enough_tickets?
    self.user.tickets > self.attraction.tickets
  end

  def tall_enough?
    self.user.height > self.attraction.min_height
  end

  def update_user
    new_tickets =  self.user.tickets - self.attraction.tickets
    new_nausea = self.user.nausea + self.attraction.nausea_rating
    new_happiness = self.user.happiness + self.attraction.happiness_rating
     self.user.update(
      :happiness => new_happiness,
      :nausea => new_nausea,
      :tickets => new_tickets
    )
  end


end
