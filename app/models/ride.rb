class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

	def take_ride
		if meets_requirements?
			update_stats
		else
			rejection_message
		end
	end

	def meets_requirements?
		enough_tickets? && enough_height?
	end

	private

	def enough_tickets?
		(self.user.tickets - self.attraction.tickets) >= 0
	end
	def enough_height?
		(self.user.height - self.attraction.min_height) >= 0
	end

	def update_stats
		self.user.update(
			:tickets => self.user.tickets - self.attraction.tickets,
			:nausea => self.user.nausea + self.attraction.nausea_rating,
			:happiness => self.user.happiness + self.attraction.happiness_rating)
	end



	def rejection_message
		msg = ""
		if !enough_tickets? && !enough_height?
			msg << "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
		elsif !enough_tickets?
			msg << "Sorry. You do not have enough tickets to ride the #{attraction.name}."
		elsif !enough_height?
			msg << "Sorry. You are not tall enough to ride the #{attraction.name}."
		end
		msg
	end
end
