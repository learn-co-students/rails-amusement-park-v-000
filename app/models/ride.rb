class Ride < ActiveRecord::Base
	belongs_to :attraction
	belongs_to :user
	validates :user_id, presence: true
	validates :attraction_id, presence: true

	def take_ride
		if user_has_insufficient_tickets? && user_too_short?
			"Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
		elsif user_has_insufficient_tickets?
			"Sorry. You do not have enough tickets to ride the #{attraction.name}."
		elsif user_too_short?
			"Sorry. You are not tall enough to ride the #{attraction.name}."
		else 
			user.tickets = user.tickets - attraction.tickets
			user.nausea = user.nausea + attraction.nausea_rating
			user.happiness = user.happiness + attraction.happiness_rating
			user.save
			"Thanks for riding the #{attraction.name}!"
		end
	end


	def user_has_insufficient_tickets?
		user.tickets < attraction.tickets
	end

	def user_too_short?
		user.height < attraction.min_height
	end

end