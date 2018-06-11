class User < ActiveRecord::Base
	has_secure_password

	has_many :rides
	has_many :attractions, through: :rides

	def mood
		if self.admin == false
		
			if self.nausea > self.happiness
				return "sad"
			elsif self.nausea <= self.happiness
				return "happy"
			end
		end
	end

end
