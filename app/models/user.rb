require 'pry'
class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
  if !self.admin
    if self.happiness > self.nausea
      return "happy"
    end
    if self.nausea >= self.happiness
      return "sad"
    end
  end
  end

end
