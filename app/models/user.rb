class User < ActiveRecord::Base
	has_secure_password
	has_many :rides
	has_many :attractions, through: :rides
	validates :password_digest, presence: true
	
	# validates :name, presence: true
	# validates :happiness, presence: true
	# validates :nausea, presence: true
	# validates :tickets, presence: true
	# validates :height, presence: true

	def mood
	  if self.nausea && self.happiness
		if self.nausea >= self.happiness
			return "sad"
		else
			return "happy"
		end
	  end

	end

end
