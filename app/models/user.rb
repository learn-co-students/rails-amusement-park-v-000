class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  # validates :email, presence: :true
  # validates :email, uniqueness: :true

  def mood
    if nausea.to_i > happiness.to_i
      "sad"
    else
      "happy"
    end
  end
end
