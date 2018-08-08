class User < ActiveRecord::Base
  has_many :attractions, through: :rides
  has_many :rides
  has_secure_password

  validates :password, presence: true


  def mood
    if happiness > nausea
        "happy"
    else
       "sad"
    end
  end

end
