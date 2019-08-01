class Ride < ApplicationRecord
  belongs_to :attraction
  belongs_to :user

  def take_ride
    # change to case statement?
    if attraction.tickets > user.tickets && attraction.min_height > user.height
      "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
    elsif attraction.tickets > user.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif attraction.min_height > user.height
      "Sorry. You are not tall enough to ride the Roller Coaster."
    else
      user.update(:tickets => user.tickets - attraction.tickets, :nausea => user.nausea + attraction.nausea_rating, :happiness => user.happiness + attraction.happiness_rating)
    end
  end

end
