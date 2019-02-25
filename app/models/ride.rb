class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if self.user.height >= self.attraction.min_height #tall enough
      if self.user.tickets >= self.attraction.tickets #enough tickets
        #enough tickets and tall enough -> take the ride
        self.user.update(
          :tickets => self.user.tickets - self.attraction.tickets,
          :happiness => self.user.happiness + self.attraction.happiness_rating,
          :nausea => self.user.nausea + self.attraction.nausea_rating
        )
        "Thanks for riding the #{self.attraction.name}!"

      else
        "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
      end

    elsif self.user.tickets < self.attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."

    else
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."

    end
  end


end
