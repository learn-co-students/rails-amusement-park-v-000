class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if  self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}." " You are not tall enough to ride the #{self.attraction.name}." 
      elsif self.user.tickets < self.attraction.tickets
        "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
      elsif self.user.height < self.attraction.min_height
        "Sorry. You are not tall enough to ride the #{self.attraction.name}."
      else
        update_user
        "Thanks for riding the #{self.attraction.name}!"
    end 
  end

private
  def update_user
    self.user.tickets = user.tickets - attraction.tickets
    self.user.nausea = user.nausea + attraction.nausea_rating
    self.user.happiness = user.happiness + attraction.happiness_rating
    self.user.save
    
  end

end
