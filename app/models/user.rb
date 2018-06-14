class User < ActiveRecord::Base
	validates :password, presence: true 
	#validates :password, confirmation: true 
	#validates :password_confirmation, presence: true 

	has_many :rides 
	has_many :attractions, through: :rides 

	def mood 

		(self.nausea > self.happiness) ? "sad" : "happy" 
	end 
end
