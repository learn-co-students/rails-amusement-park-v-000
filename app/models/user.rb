class User < ActiveRecord::Base

	validates :name, :password, presence: true
	has_many :rides
	has_many :attractions, through: :rides

	def mood
		if !nausea.nil? && !happiness.nil?
			nausea > happiness ? "sad" : "happy"
		end
	end

	def login(session)
		session[:user_id] = id
	end

end
