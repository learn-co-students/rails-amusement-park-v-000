class Attraction < ApplicationRecord
	has_many :rides
	has_many :users, through: :rides

	def invite
		"Go on #{self.name}"
	end
end
