class Attraction < ApplicationRecord
	has_many :rides 
	has_many :users, through: :rides 

	def index_link(user)
		if user.admin 
			"Show #{self.name}"
		else 
			"Go on #{self.name}"
		end 
	end 
	
end
