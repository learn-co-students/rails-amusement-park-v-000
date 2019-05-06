class Ride < ActiveRecord::Base
 belongs_to :attraction
 belongs_to :user

 def take_ride
   if !tall_enough && !enough_tickets
     "Sorry. " + too_few_tickets + " " + not_tall_enough
   elsif !enough_tickets
     "Sorry. " + too_few_tickets
   elsif !tall_enough
     "Sorry. " + not_tall_enough
   else
     start_ride
   end
 end

 def tall_enough
   self.user.height >= self.attraction.min_height
 end

 def enough_tickets
   self.user.tickets >= self.attraction.tickets
 end

 def start_ride
   self.user.tickets -= self.attraction.tickets
   self.user.nausea += self.attraction.nausea_rating
   self.user.happiness += self.attraction.happiness_rating
   self.user.save
   "Thanks for riding the #{self.attraction.name}!"
 end

 def too_few_tickets
   "You do not have enough tickets to ride the #{self.attraction.name}."
 end

 def not_tall_enough
   "You are not tall enough to ride the #{self.attraction.name}."
 end
end
