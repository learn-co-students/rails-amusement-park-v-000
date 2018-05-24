class User < ApplicationRecord
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  validates :happiness, inclusion: 1..5
  validates :nausea, inclusion: 1..5

  def mood
    (self.happiness - self.nausea) > 0 ? "happy" : "sad"
  end

end
