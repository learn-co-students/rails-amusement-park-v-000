class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    return nil if self.nausea.nil? || self.happiness.nil?
    self.nausea > self.happiness ? "sad" : "happy"
  end
end
