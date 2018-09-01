class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if (self.attraction.tickets > self.user.tickets) && (self.attraction.min_height > self.user.height)
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif self.attraction.tickets > self.user.tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif attraction.min_height > user.height
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      user.update(:tickets => (self.user.tickets - self.attraction.tickets),
        :happiness => (self.user.happiness + self.attraction.happiness_rating), :nausea => (self.user.nausea + self.attraction.nausea_rating))
      "Thanks for riding the #{self.attraction.name}!"
    end
  end

  # check_tickets
  # check_height
  # update_mood


  # helper methods
  # def check_tickets
  #   if self.user.tickets <= self.attraction.tickets
  #     return false
  #   else
  #     return true
  #   end
  # end
  #
  # def check_height
  #   if self.user.height >= self.attraction.height
  #     return false
  #   else
  #     return true
  #   end
  # end

end
