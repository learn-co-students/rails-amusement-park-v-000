class User < ApplicationRecord
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

    # validates presence_of :name,  :nausea, :happiness, :tickets, :height,   presence: true

  def mood
    if self.happiness && self.nausea
      if self.nausea > self.happiness
        mood =  "sad"
      else 
        mood =  "happy"
       end
    end
  end

  # def mof
  #   if self.happiness && self.nausea
  #     mood = self.happiness - self.nausea
  #     mood > 0 ? "happy" : "sad"
  #   end 
  # end 

    # or: one minus the other, mood > 0 ? happy : sad


# what am i trying to do: compare @user.nausea and @user.happiness
 # happiness > nausea ? happy : sad 

end