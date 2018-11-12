class User < ApplicationRecord
  has_many :rides
  has_many :attractions, through: :rides

  has_secure_password

  def mood
    nausea < happiness ? "happy" : "sad"
  end
end
