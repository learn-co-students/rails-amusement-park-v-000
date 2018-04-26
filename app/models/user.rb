class User < ApplicationRecord
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides
  validates :name, uniqueness: true

  def mood
    unless admin
      happiness > nausea ? 'happy' : 'sad'
    end
  end
end
