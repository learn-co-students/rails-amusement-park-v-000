class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if attraction.tickets > user.tickets && attraction.min_height > user.height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif attraction.tickets > user.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif attraction.min_height > user.height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      updated_tickets = user.tickets - attraction.tickets
      user.tickets = updated_tickets
      updated_happiness = user.happiness + attraction.happiness_rating
      user.happiness = updated_happiness
      updated_nausea = user.nausea + attraction.nausea_rating
      user.nausea = updated_nausea
      user.save
      "Thanks for riding the #{attraction.name}!"
    end
  end


end
