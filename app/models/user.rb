class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  #has_secure_password

  def happiness_level
    if self.happiness && self.nausea
      happy_level = self.happiness - self.nausea
      self.happiness = happy_level
    else
      self.happiness = 0
    end
  end

  def mood
    if happiness_level > 0
      return "happy"
    else
      return "sad"
    end
  end

end
