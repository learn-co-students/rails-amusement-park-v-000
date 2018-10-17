class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  validates :password, presence: true

def mood
  if self.happiness && self.nausea
    self.happiness > self.nausea ? "happy" : "sad"
  end
end

  def num_of_rides
    self.attractions.count
  end
end
