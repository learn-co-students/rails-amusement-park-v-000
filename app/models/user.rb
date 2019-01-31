class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def happy?
    self.happiness > self.nausea ? true : nil
  end

  def sad?
    self.nausea > self.happiness ? true : nil
  end

  def mood
    if happy?
      "happy"
    elsif sad?
      "sad"
    else
      nil
    end
  end

end
