class User < ApplicationRecord
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

    # validates presence_of :name,  :nausea, :happiness, :tickets, :height,   presence: true

  def mood
    if self.nausea > self.happiness
        mood = "sad"
    else 
        mood = "happy"
        # what about equal? 
    end
    # or: one minus the other, mood > 0 ? happy : sad
  end

end