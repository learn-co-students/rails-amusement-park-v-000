class User < ActiveRecord::Base
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  def mood
    # This breaks if happiness is nil; maybe I need a validation?
    
    if self.happiness > self.nausea
      "happy"
    elsif self.happiness == self.nausea
      "apathetic" # I added this
    else
      "sad"
    end
  end
end
