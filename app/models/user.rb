class User < ApplicationRecord
	has_many :rides
	has_many :attractions, through: :rides

#	validates :height, presence: true, numericality: {only_integer: true, greater_than: 0}
#	validates :happiness, presence: true, numericality: {only_integer: true, greater_than: 0, less_than: 6}
#	validates :nausea, presence: true, numericality: {only_integer: true, greater_than: 0, less_than: 6}
#	validates :tickets, presence: true, numericality: {only_integer: true}
	validates :name, presence: true
	validates :name, uniqueness: true

	has_secure_password

	def mood
		if self.admin
			'happy'
		elsif self.nausea > self.happiness
			'sad'
		else
			'happy'
		end
	end

	def first_name
		self.name.split(' ')[0]
	end
end
