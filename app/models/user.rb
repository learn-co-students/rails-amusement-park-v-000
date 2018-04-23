class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  validates :name, presence: true

  def mood
    happiness > nausea ? "happy" : "sad"
  end

end
