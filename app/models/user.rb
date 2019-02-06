class User < ActiveRecord::Base
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  def mood #'mood' that returns 'sad' when the user is more nauseous than happy, returns 'happy' when the user is more happy than nauseous
    self.nausea > self.happiness ? "sad" : "happy"
  end

end
