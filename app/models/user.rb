class User < ActiveRecord::Base
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if nausea == nil || happiness == nil
      return nil
    else
      if nausea > happiness
        return "sad"
      else
        return "happy"
      end
    end
  end
end
