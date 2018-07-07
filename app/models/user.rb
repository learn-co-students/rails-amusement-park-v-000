class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  has_secure_password

  def mood
    #user = User.find(self.id)
    if self.happiness && self.nausea
    if self.happiness < self.nausea
      mood = 'sad'
    else
      mood = 'happy'
    end
  end
end

end
