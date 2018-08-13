class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  validates :password, presence: true
  validates :name, :height, :happiness, :nausea, :tickets, presence: true
  validates :name, uniqueness: true


  def mood
    if happiness > nausea
        "happy"
    else
       "sad"
    end
  end

end
