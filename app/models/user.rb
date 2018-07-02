class User < ActiveRecord::Base
  has_secure_password
  # validates_presence_of :tickets
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    happiness = self.happiness.to_i
    net_happiness = happiness - self.nausea.to_i
    if net_happiness >= 1
      "happy"
    else
        "sad"
    end
    
  end
end
