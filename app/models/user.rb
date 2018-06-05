class User < ApplicationRecord
  validates :password, presence: true

  has_many :rides
  has_many :attractions, through: :rides

  def mood
    self.nausea.to_i > self.happiness.to_i ? 'sad' : 'happy'
  end
end
