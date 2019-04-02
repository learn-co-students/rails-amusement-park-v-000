class User < ActiveRecord::Base
  validates_presence_of :name, :happiness, :nausea, :height, :tickets
  has_secure_password

  has_many :rides
  has_many :attractions, :through => :rides

  def mood
    if self.happiness && self.nausea
      mood = self.happiness - self.nausea
      if mood > 0
        "happy"
      else
        "sad"
      end
    end
  end

end
