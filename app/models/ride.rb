class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    u = self.user
    a = self.attraction

    if u.height < a.min_height && u.tickets < a.tickets
      return "Sorry. You do not have enough tickets to ride the #{a.name}. You are not tall enough to ride the #{a.name}."
    elsif u.tickets < a.tickets
      return "Sorry. You do not have enough tickets to ride the #{a.name}."
    elsif u.height < a.min_height
      return "Sorry. You are not tall enough to ride the #{a.name}."

    else
      # updates ticket number
      u.update(tickets: u.tickets -= a.tickets)
      # updates user's nausea
      u.update(nausea: u.nausea + a.nausea_rating)
      # updates user's happiness
      u.update(happiness: u.happiness + a.happiness_rating)

      u.save

      puts "Weeeeee, that was fun!"
    end

  end

end
