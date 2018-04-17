class User < ActiveRecord::Base
	has_secure_password
	validates_presence_of :name, :password#, :nausea, :happiness, :tickets, :height

	has_many :rides
	has_many :attractions, through: :rides

	def mood
	  if nausea.present? && happiness.present?
	    nausea > happiness ? 'sad' : 'happy'
	  end
	end

end
