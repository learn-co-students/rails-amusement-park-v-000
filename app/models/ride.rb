require 'pry'

class Ride < ActiveRecord::Base
	belongs_to :attraction 
	belongs_to :user

	def take_ride
 
		if user.tickets < attraction.tickets && user.height < attraction.min_height
			return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."

		elsif user.tickets < attraction.tickets
			return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
		elsif user.height < attraction.min_height
			return "Sorry. You are not tall enough to ride the #{attraction.name}."
		else

		user.tickets = user.tickets - attraction.tickets
		user.nausea += attraction.nausea_rating
		user.happiness += attraction.happiness_rating
			
		user.save
		
		# return "Thanks for riding the #{attraction.name}!"
		# see spec for details
		end
		
	end

	def self.user_ride(ride)
		
			if !ride.blank? 
				return "Thanks for riding the #{ride.attraction.name}!"
			else
				return "You are not tall enough to ride the Teacups"
			
			end

		end

end
