class User < ActiveRecord::Base
  #not without without pw
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  # valid with admin boolean
  #validates :admin, :name, :password, :happiness, :nausea, :height, :tickets, :presence => true

  def mood
    #returns sad when user is more nauseas than happy
    if self.happiness > self.nausea
      "happy"
    else
      "sad"
    end
    # returns happy when user is more happy than nausous
  end
end
