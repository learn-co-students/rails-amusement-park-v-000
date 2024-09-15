class User < ApplicationRecord
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
    if happiness.to_i > nausea.to_i
      mood = "happy"
    elsif nausea.to_i > happiness.to_i
      mood = "sad"
    end
    mood
  end

  def user_type
    self.admin ? "ADMIN" : "USER"
  end
end
