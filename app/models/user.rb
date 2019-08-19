class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  validates :name, uniqueness: true, presence: true

  has_secure_password
  
  def mood
    happiness < nausea ? "sad" : "happy" if admin == false
    

  end

end
