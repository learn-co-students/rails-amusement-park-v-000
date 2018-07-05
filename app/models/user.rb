class User < ActiveRecord::Base
	has_many :rides
	has_many :attractions, through: :rides
	has_secure_password

	def mood
		if self.happiness > self.nausea
			return "happy"
		elsif self.nausea > self.happiness
			return "sad"
		elsif self.nausea == self.happiness
			return "meh"
		end
	end
end
