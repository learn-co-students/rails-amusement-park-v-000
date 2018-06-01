class Ride < ApplicationRecord
	belongs_to :user
	belongs_to :attraction

	def take_ride
		#takes into account 
			#user not having enough tickets
			#user not being tall enough
			#user not being tall enough AND not having enough tickets
			#updates ticket number (current-minus this ride equals)
			#updates rider's nausea
			#updates user's happiness

	end

end
