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
		end

		user.tickets = user.tickets - attraction.tickets
		user.nausea += 2
		user.happiness += 4
			
		user.save
		# see spec for details
	end


end
