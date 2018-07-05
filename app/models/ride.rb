class Ride < ActiveRecord::Base
	belongs_to :user
	belongs_to :attraction

	def take_ride
		if !self.tall_enough? && !self.enough_tickets?
			"Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
		elsif self.tall_enough? && !self.enough_tickets?
			self.ticket_response
		elsif self.enough_tickets? && !self.tall_enough?
			self.height_response
		elsif self.tall_enough? && self.enough_tickets?
			self.height_response
			self.ticket_response
		end
	end

	def tall_enough?
		self.user.height > self.attraction.min_height
	end

	def enough_tickets?
		self.user.tickets >= self.attraction.tickets
	end

	def height_response
		if self.tall_enough? 
			self.user.happiness = self.user.happiness + self.attraction.happiness_rating
			self.user.nausea = self.user.nausea + self.attraction.nausea_rating
			self.user.save
		else
			"Sorry. You are not tall enough to ride the #{self.attraction.name}."
		end
	end

	def ticket_response
		if self.enough_tickets?
			self.user.tickets = self.user.tickets - self.attraction.tickets
			self.user.save
		else
			"Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
		end
	end

end
