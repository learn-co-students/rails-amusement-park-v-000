class User < ApplicationRecord
	has_many :rides
	has_many :attractions, through: :rides
	has_secure_password

	def mood
		if self.happiness < self. nausea
			"sad"
		else
			"happy"
		end
	end


end
