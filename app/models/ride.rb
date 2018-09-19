class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    user = self.user
    attraction = self.attraction

    if user.tickets < attraction.tickets && user.height < attraction.min_height
      both_insufficient
    elsif user.tickets < attraction.tickets
      insufficient_tickets
    elsif user.height < attraction.min_height
      insufficient_height
    else
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save

      "Thanks for riding the #{self.attraction.name}!"
    end
  end

  def insufficient_tickets
    "Sorry. You do not have enough tickets to ride the #{attraction.name}."
  end

  def insufficient_height
    "Sorry. You are not tall enough to ride the #{attraction.name}."
  end

  def both_insufficient
    "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
  end

end
