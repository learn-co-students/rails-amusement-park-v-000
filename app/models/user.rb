class User < ActiveRecord::Base
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  # validates :name, presence: true
  # validates :password, presence: true
  # validates :nausea, presence: true
  # validates :happiness, presence: true
  # validates :tickets, presence: true
  # validates :height, presence: true

  def mood
    if self.happiness && self.nausea
      mood = self.happiness - self.nausea
      mood > 0 ? "happy" : "sad"
    end
  end

end
