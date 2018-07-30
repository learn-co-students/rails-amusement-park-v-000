
class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  before_create :default

  def default
    self.admin = false
  end

  def mood
    if self.nausea.nil? || self.happiness.nil?
      "WHO CARES"
    else
      if self.nausea > self.happiness
        "sad"
      else
        "happy"
      end
    end
  end

end
