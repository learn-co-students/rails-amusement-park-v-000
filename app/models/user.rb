class User < ApplicationRecord

  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  # def mood
  #   if self.nausea > self.happiness
  #     "sad"
  #   elsif
  #     self.happiness > self.nausea
  #      "happy"
  #   end
  # end

  def mood
    if nausea && happiness
    self.nausea > self.happiness ? "sad" : "happy"
    end
    #if a ? then b : if not then c
  end

end
