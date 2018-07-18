class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  validates :name, presence: true, uniqueness: true
  #validates :tickets, presence: true
  #validates :height, presence: true
  #validates :nausea, presence: true
  #validates :happiness, presence: true

  #def mood
    #if self.nausea > self.happiness
      #mood = "sad"
    #else
      #mood = "happy"
    #end
  #end

  def mood
    if self.happiness && self.nausea
      self.happiness > self.nausea ? "happy" : "sad"
    end
  end
end
