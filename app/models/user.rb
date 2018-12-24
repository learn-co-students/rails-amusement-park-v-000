class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    user = User.last
    user.nausea > user.happiness ? "sad" : "happy"
  end
end
