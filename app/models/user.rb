class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if nausea > happiness
      "sad"
    else
      "happy"
    end
  end
end
