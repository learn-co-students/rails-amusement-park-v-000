class Ride < ActiveRecord::Base

  belongs_to :user
  belongs_to :attraction

  def take_ride
    ride = self.attraction
    user = self.user

    if user.height > ride.min_height && user.tickets > ride.tickets
      user.tickets = user.tickets - ride.tickets
      user.nausea = user.nausea + ride.nausea_rating
      user.happiness = user.happiness + ride.happiness_rating
      user.save
        @message =  "Thanks for riding the #{ride.name}!"
    elsif user.height > ride.min_height && user.tickets < ride.tickets
        @message = "Sorry. You do not have enough tickets to ride the #{ride.name}."
    elsif user.height < ride.min_height && user.tickets > ride.tickets
        @message = "Sorry. You are not tall enough to ride the #{ride.name}."
    else
        @message = "Sorry. You do not have enough tickets to ride the #{ride.name}. You are not tall enough to ride the #{ride.name}."
      end
  end

    if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif self.user.height < self.attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif self.user.tickets < self.attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif self.user.tickets > self.attraction.tickets
      self.user.tickets -= self.attraction.tickets
      self.user.nausea += self.attraction.nausea_rating
      self.user.happiness += self.attraction.happiness_rating
      self.user.save
    end
  end


end
