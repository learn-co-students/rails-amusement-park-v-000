class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction


  def take_ride
    user_height = self.user.height
    user_tickets = self.user.tickets
    if
      user_tickets <= self.attraction.tickets && user_height <= self.attraction.min_height
      both_insufficient

    elsif
      user_height <= self.attraction.min_height
      insufficient_height
    elsif
      user_tickets <= self.attraction.tickets
      insufficient_tickets
    else
      update_user
      "Thanks for riding the #{self.attraction.name}!"

    end
  end

  def update_user

    new_tickets = self.user.tickets - self.attraction.tickets
    new_nausea = self.user.nausea + self.attraction.nausea_rating
    new_happiness = self.user.happiness + self.attraction.happiness_rating
    self.user.update(
      :happiness => new_happiness,
      :nausea => new_nausea,
      :tickets => new_tickets
    )
  end

  def both_insufficient
    "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
  end

  def insufficient_tickets
    "Sorry. You do not have enough tickets to ride the #{attraction.name}."

  end

  def insufficient_height
    "Sorry. You are not tall enough to ride the #{attraction.name}."
  end
end
