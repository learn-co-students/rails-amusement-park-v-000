class User < ApplicationRecord
  has_many :rides
  has_many :attractions, through: :rides

  validates :name, :password, presence: true, on: :create
  validates :name, uniqueness: true, on: :create

  has_secure_password

  def mood
    self.nausea > self.happiness ? "sad" : "happy" if self.nausea && self.happiness
  end
end
