class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    if happiness && nausea
      mood = happiness - nausea
      if mood < 0
        "sad"
      else
        "happy"
      end
    end
  end

end
