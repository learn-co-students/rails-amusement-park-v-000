class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides



  def mood
    #returns sad when the user is more nauseaous than happy, or happy when the opposite
    if self.nausea > self.happiness
      'sad'
    else
      'happy'
    end
  end



end
