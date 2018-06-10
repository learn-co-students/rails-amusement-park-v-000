class Ride < ApplicationRecord
	belongs_to :user
	belongs_to :attraction

	# def user_has_enough_tickets
	# 	self.user.tickets >= self.attraction.tickets
	# end

	# def user_is_tall_enough
	# 	self.user.height >= self.attraction.min_height
	# end

	def take_ride
		user_has_enough_tickets, user_is_tall_enough = user_meets_requirements
		 # binding.pry
		if user_has_enough_tickets && user_is_tall_enough
			start_ride
		elsif user_is_tall_enough && !user_has_enough_tickets
			"Sorry. " + not_enough_tickets
		elsif user_has_enough_tickets && !user_is_tall_enough
			"Sorry. " + not_tall_enough
		else
			"Sorry. " + not_enough_tickets + " " + not_tall_enough
		end
	end
			
	def user_meets_requirements
		user_has_enough_tickets, user_is_tall_enough = false
		# binding.pry
		if self.user.tickets >= self.attraction.tickets
			user_has_enough_tickets = true
		end
		if self.user.height >= self.attraction.min_height
			user_is_tall_enough = true
		end
		return [user_has_enough_tickets, user_is_tall_enough]
	end

	def start_ride
		new_happiness = self.user.happiness + self.attraction.happiness_rating
		new_nausea = self.user.nausea + self.attraction.nausea_rating
		new_tickets_count = self.user.tickets - self.attraction.tickets
		self.user.update(
			:happiness => new_happiness,
			:nausea => new_nausea,
			:tickets => new_tickets_count
			)
		"Thanks for riding the #{self.attraction.name}!"
	end

	def not_enough_tickets
		"You do not have enough tickets to ride the #{self.attraction.name}."
	end

	def not_tall_enough
		"You are not tall enough to ride the #{self.attraction.name}."
	end

end
