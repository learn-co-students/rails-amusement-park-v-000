class User < ApplicationRecord
  validates :password, presence: true

  has_many :rides
  has_many :attractions, through: :rides

  def mood
  end

end
