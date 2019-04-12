class User < ActiveRecord::Base
	has_many :rides
	has_many :attractions, through: :rides

	has_secure_password

	def mood 	
     self.nausea > self.happiness ? "sad" : "happy" if self.nausea && self.happiness 
	end 
end
