class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    errors = []
    if !!meet_condition
      update_user
      return "Thanks for riding the #{self.attraction.name}!"
    end
    if self.user.tickets < self.attraction.tickets
      errors << "You do not have enough tickets to ride the #{self.attraction.name}."
    end
    if self.user.height < self.attraction.min_height
      errors << "You are not tall enough to ride the #{self.attraction.name}."
    end
    if !errors.empty?
      return "Sorry. " + errors.join(" ")
    end
  end



  def meet_condition
    self.user.tickets >= self.attraction.tickets && self.user.height >= self.attraction.min_height
  end



  def update_user
    self.user.tickets -= self.attraction.tickets
    self.user.nausea += self.attraction.nausea_rating
    self.user.happiness += self.attraction.happiness_rating
    self.user.save

  end

end
