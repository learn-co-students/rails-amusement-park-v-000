class User < ActiveRecord::Base
	has_secure_password
	has_many :rides
	has_many :attractions, through: :rides

	def mood
		if !admin
			if nausea > happiness
				mood = "sad"
			else
				mood = "happy"
			end
		end
	end
end
