class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    error = []
    if self.user.tickets < self.attraction.tickets
      error << "You do not have enough tickets to ride the #{self.attraction.name}."
    end
    if self.user.height < self.attraction.min_height
      error << "You are not tall enough to ride the #{self.attraction.name}."
    end
    if !error.empty?
      "Sorry. " + error.join(" ")
    else
      self.user.tickets -= self.attraction.tickets
      self.user.nausea += self.attraction.nausea_rating
      self.user.happiness += self.attraction.happiness_rating
      self.user.save 
    end
  end




end
