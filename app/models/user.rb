class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  validates :name, presence: true
  validates :name, uniqueness: true
  has_secure_password

  def mood
    self.happiness > self.nausea ? "happy" : "sad"
  end

end
