class User < ActiveRecord::Base
  has_secure_password
  validates :password, presence: true
  has_many :rides
  has_many :attractions, through: :rides


  def mood
    nausea > happiness ? "sad" : "happy"
  end

end
