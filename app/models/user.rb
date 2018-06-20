class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    happiness = self.happiness
    case happiness
    when 1..3
      "sad"
    when 7..100
      "happy"
    else
      "fine"
    end
  end
end
