class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if ticket && height
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif ticket
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif height
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      update_user

      "Thanks for riding the #{self.attraction.name}!"
    end
  end

  def ticket
    self.user.tickets < self.attraction.tickets
  end

  def height
    self.user.height < self.attraction.min_height
  end

  def update_user
    user = self.user
    user.tickets = user.tickets - self.attraction.tickets
    user.nausea = user.nausea + self.attraction.nausea_rating
    user.happiness = user.happiness + self.attraction.happiness_rating
    user.save
  end
end
