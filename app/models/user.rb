class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  attr_accessor :ride

  def mood
    self.nausea > self.happiness ? "sad" : "happy" unless self.is_admin?
  end

  def is_admin?
    self.admin == true
  end
end
