class Ride < ActiveRecord::Base
	belongs_to :user
	belongs_to :attraction

	def take_ride
		if (self.user.height >= self.attraction.min_height) && (self.user.tickets >= self.attraction.tickets)
			self.user.happiness += self.attraction.happiness_rating
			self.user.nausea += self.attraction.nausea_rating
			self.user.tickets -= self.attraction.tickets
			self.user.save

			"Thanks for riding the #{self.attraction.name}!"
		elsif (self.user.height < self.attraction.min_height) && (self.user.tickets < self.attraction.tickets)
			"Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
		elsif self.user.tickets < self.attraction.tickets
			"Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
		elsif self.user.height < self.attraction.min_height
			"Sorry. You are not tall enough to ride the #{self.attraction.name}."
		end
	end


end
