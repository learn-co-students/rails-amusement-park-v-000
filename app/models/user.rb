class User < ActiveRecord::Base

  validates :name, presence: true
  validates :password, presence: true
  # validates :nausea, presence: true
  # validates :happiness, presence: true
  # validates :ticket, presence: true
  # validates :height, presence: true

  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.happiness > self.nausea
      "happy"
    else
      "sad"
    end
  end

end
