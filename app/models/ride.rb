class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

#needs refactoring, was having issues getting tests to pass
  def take_ride
    if user.tickets < attraction.tickets && user.height < attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      user.tickets = user.tickets - attraction.tickets
      user.nausea = user.nausea + attraction.nausea_rating
      user.happiness = user.happiness + attraction.happiness_rating
      user.save
      "Thanks for riding the #{self.attraction.name}!"
    end
  end

end
