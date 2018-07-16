class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood(happy)
    if self.happiness > self.nausea
      'happy'
    else
      'sad'
    end
  end


end
