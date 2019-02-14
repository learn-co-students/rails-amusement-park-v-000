class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    issues = []
    issues << "You do not have enough tickets to ride the #{attraction.name}." if self.user.tickets < self.attraction.tickets
    issues << "You are not tall enough to ride the #{attraction.name}." if self.user.height < self.attraction.min_height

    if issues.any?
      "Sorry. " + issues.join(' ')
    else
      self.user.update_stats(nausea: attraction.nausea_rating, happiness: attraction.happiness_rating, tickets: attraction.tickets)
    end
  end

end
