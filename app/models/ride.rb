class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    # I'm missing something conceptually to understand how @ride can access the attractions and users info
    if @ride.attraction.tickets > @ride.user.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif @ride.attraction.
    end
  end

end
