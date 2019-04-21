class User < ActiveRecord::Base
	has_many :rides
	has_many :attractions, through: :rides
	validates :name, presence: true
	validates :password, presence: true
	has_secure_password

	def mood
		if nausea && happiness
			if nausea > happiness
			'sad'
			else
				'happy'
			end
		end
	end

end
