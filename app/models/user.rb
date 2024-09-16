class User < ActiveRecord::Base
  has_many :rides
	has_many :attractions, through: :rides
	validates :name, presence: true
	has_secure_password

	def mood
		if nausea > happiness
			'sad'
		elsif nausea < happiness
			'happy'
		else
			'neutral'
		end
	end

  def is_admin?
		@admin
	end
end
