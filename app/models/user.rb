class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  accepts_nested_attributes_for :attractions
  has_secure_password

  def mood
    self.nausea > self.happiness ? "sad" : "happy"
  end
end
