require 'pry'
class User < ApplicationRecord
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    #binding.pry
    user = self
    if user.nausea > user.happiness
      "sad"
    elsif user.nausea < user.happiness
      "happy"
    end

  end

end
