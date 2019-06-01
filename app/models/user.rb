class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    #binding.pry
    if happiness != nil && nausea != nil
      if happiness > nausea
        return "happy"
      else
        return "sad"
      end
    end
  end


end
