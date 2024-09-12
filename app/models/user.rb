class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  validates :name,
    presence: true,
    uniqueness: true, 
    on: :create

  validates :password,
    presence: true,
    on: :create

  def mood
  	# check if the user is more nauseous than happy
    self.nausea > self.happiness ? "sad" : "happy"
  end

  def user_type
    self.admin ? "ADMIN" : "USER"
  end

end
