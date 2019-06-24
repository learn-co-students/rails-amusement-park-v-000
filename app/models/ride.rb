class Ride < ApplicationRecord
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if attraction.tickets > user.tickets && attraction.min_height > user.height
      # The user doesn't have enough tickets and isn't tall enough to ride the attraction
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif attraction.tickets > user.tickets
      # The user doesn't have enough tickets to ride the attraction
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif attraction.min_height > user.height
      # The user isn't tall enough to ride the attraction
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else # The user rides the attraction
      # Update the user's number of tickets, nausea, and happiness
      user.update(tickets: user.tickets -= attraction.tickets, nausea: user.nausea += attraction.nausea_rating, happiness: user.happiness += attraction.happiness_rating)
    end
  end
end
