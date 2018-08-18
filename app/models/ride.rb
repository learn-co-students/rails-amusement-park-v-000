class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def ride_attraction
    self.attraction
  end

  def ride_user
    self.user
  end

  def attraction_name
    ride_attraction.name
  end

  def tall_enough
    ride_user.height >= ride_attraction.min_height
  end

  def enough_tickets
    ride_user.tickets >= ride_attraction.tickets
  end

  def message
    if !tall_enough && !enough_tickets
      "Sorry. You do not have enough tickets to ride the #{attraction_name}. You are not tall enough to ride the #{attraction_name}."
    elsif !tall_enough
      "Sorry. You are not tall enough to ride the #{attraction_name}."
    elsif !enough_tickets
      "Sorry. You do not have enough tickets to ride the #{attraction_name}."
    else
      "Thanks for riding the #{attraction_name}!"
    end
  end

  def take_ride
    if ride_user && ride_attraction
      if tall_enough && enough_tickets
        new_tickets = ride_user.tickets - ride_attraction.tickets
        new_nausea = ride_user.nausea + ride_attraction.nausea_rating
        new_happiness = ride_user.happiness + ride_attraction.happiness_rating
        ride_user.update(
          tickets: new_tickets,
          nausea: new_nausea,
          happiness: new_happiness
        )
        message
      else
        message
      end
    end
  end


end
