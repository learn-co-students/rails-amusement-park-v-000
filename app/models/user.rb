class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  validates :password, presence: true
  has_secure_password

  def mood
    if nausea && happiness
      nausea > happiness ? "sad" : "happy"
    end
  end
end
