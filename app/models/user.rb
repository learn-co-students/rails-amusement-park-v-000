class User < ApplicationRecord
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if nausea < happiness
      mood = "happy"
    else
      mood = "sad"
    end
  end

end
