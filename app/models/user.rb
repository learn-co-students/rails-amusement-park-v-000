class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  validates :name,
    presence: true,
    uniqueness: true, 
    on: :create

  validates :password,
    presence: true,
    on: :create

  def mood
    # if the user is more nauseous than happy
    mood = "okay"
    if happiness > nausea
      mood = "happy"
    elsif nausea > happiness
      mood = "sad"
    end
    mood
  end

  def user_type
    self.admin ? "ADMIN" : "USER"
  end

end
