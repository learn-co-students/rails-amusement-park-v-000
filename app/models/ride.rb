class Ride < ActiveRecord::Base

	belongs_to :user
	belongs_to :attraction

	def take_ride
		user = User.find_by(id: user_id)
		attraction = Attraction.find_by(id: attraction_id)
		return_error = false
		error_message = "Sorry."
		if user.tickets < attraction.tickets
			error_message.concat " You do not have enough tickets to ride the #{attraction.name}."
		end
		if user.height < attraction.min_height
			error_message.concat " You are not tall enough to ride the #{attraction.name}."
		end
		if error_message != "Sorry."
			error_message
		else
			new_tickets = user.tickets - attraction.tickets
			new_happiness = user.happiness + attraction.happiness_rating
			new_nausea = user.nausea + attraction.nausea_rating
			user.update_attributes(
				tickets: new_tickets, 
				happiness: new_happiness, 
				nausea: new_nausea)
		end
	end

end
