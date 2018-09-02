class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if (user.height < attraction.min_height) && (user.tickets < attraction.tickets)
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif user.height < attraction.min_height
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      user.update(:tickets => (user.tickets - attraction.tickets))
      user.update(:nausea => (user.nausea + attraction.nausea_rating))
      user.update(:happiness => (user.happiness + attraction.happiness_rating))
    end
  end

end
