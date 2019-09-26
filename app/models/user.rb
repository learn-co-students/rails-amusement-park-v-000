class User < ActiveRecord::Base
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  def mood
    unless admin
      if nausea > happiness
        "sad"
      else
        "happy"
      end
    end
  end

  def height_in_inches
    "#{self.height} inches"
  end

end
