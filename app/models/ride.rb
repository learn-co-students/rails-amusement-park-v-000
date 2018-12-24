class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    @ride = Ride.last
    if @ride.user.tickets < @ride.attraction.tickets && @ride.user.height < @ride.attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{@ride.attraction.name}. You are not tall enough to ride the #{@ride.attraction.name}."

    else
      @ride.user.update(tickets: update_tickets, nausea: update_nausea, happiness: update_happiness)

    end


  end

  private
  def update_tickets
    (@ride.user.tickets - @ride.attraction.tickets)
  end

  def update_nausea
    @ride.user.nausea + @ride.attraction.nausea_rating
  end

  def update_happiness
    @ride.user.happiness + @ride.attraction.happiness_rating
  end
end
