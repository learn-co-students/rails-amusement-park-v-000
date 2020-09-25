class User < ActiveRecord::Base
  validates :name, presence: true
  validates :height, presence: true
  validates :happiness, presence: true
  validates :nausea, presence: true
  validates :tickets, presence: true
  has_secure_password

  def user_mood
    "happy" if happiness.to_i >= 3
  end

end
