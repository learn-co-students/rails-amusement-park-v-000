class User < ActiveRecord::Base
	has_many :rides
	has_many :attractions, through: :rides

	has_secure_password

	validates_presence_of :password, :on => :create
	validates_presence_of :name, :on => :create

	def mood 	
     self.nausea > self.happiness ? "sad" : "happy" if self.nausea && self.happiness 
	end 
end
