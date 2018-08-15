class User < ApplicationRecord
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if nausea && happiness
      if nausea > happiness
        "sad"
      else
        "happy"
      end
    end
  end

end
