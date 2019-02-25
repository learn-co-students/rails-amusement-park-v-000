require 'pry'
class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user
  def take_ride
    fail_req = []
    
     if !!meet_requirements
       update_user
     "Thanks for riding the #{self.attraction.name}!"
    end
    
    if self.user.tickets < self.attraction.tickets
      fail_req <<  "You do not have enough tickets to ride the #{attraction.name}."
    end
    if self.user.height < self.attraction.min_height
      fail_req << "You are not tall enough to ride the #{attraction.name}."
    end
    if !fail_req.empty?
        "Sorry. " + fail_req.join(" ")
    end
  end
  
   def meet_requirements
    self.user.tickets >= self.attraction.tickets && self.user.height >= self.attraction.min_height
  end
  
  def update_user
    self.user.tickets -= self.attraction.tickets
    self.user.nausea += self.attraction.nausea_rating
    self.user.happiness += self.attraction.happiness_rating
    self.user.save
 end
end
