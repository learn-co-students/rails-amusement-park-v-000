class Ride < ActiveRecord::Base
	belongs_to :user
	belongs_to :attraction

	def take_ride
		tix = self.user.tickets
		cost = self.attraction.tickets
		
		if (cost > tix) && (self.attraction.min_height > self.user.height)
			"Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
		elsif cost > tix
			"Sorry. You do not have enough tickets to ride the #{self.attraction.name}."		
		elsif self.attraction.min_height > self.user.height
			"Sorry. You are not tall enough to ride the #{self.attraction.name}."
		else
			self.user.tickets = tix - cost
			self.user.nausea += self.attraction.nausea_rating
			self.user.happiness += self.attraction.happiness_rating
			self.user.save	
		end
	end
end
