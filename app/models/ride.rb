class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    user = self.user
    attraction = self.attraction

    if user.tickets < attraction.tickets && user.height < attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      user.update(tickets: user.tickets-attraction.tickets, nausea: user.nausea+attraction.nausea_rating, happiness: user.happiness+attraction.happiness_rating )
     "Thanks for riding the #{attraction.name}!"
    end

  end


end
