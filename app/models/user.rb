class User < ActiveRecord::Base
	has_many :rides
	has_many :attractions, through: :rides

	has_secure_password

	validates :name, presence: true
	validates :password, presence: true

	def mood 	
     self.nausea > self.happiness ? "sad" : "happy" if self.nausea && self.happiness 
	end 
end
