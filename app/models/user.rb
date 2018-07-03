class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  has_secure_password

  def mood
    user = User.find(self.id)
    if user.happiness < user.nausea
      mood = 'sad'
    else
      mood = 'happy'
    end
  end
end
