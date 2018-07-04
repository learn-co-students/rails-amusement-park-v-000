class User < ActiveRecord::Base
  has_secure_password
  # validates :name, :password, :nausea, :happiness, :tickets, :height, presence: true

  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if nausea
    if nausea > happiness
      "sad"
    else
      "happy"
    end
  end
   end
end
