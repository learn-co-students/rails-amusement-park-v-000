class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  validates_presence_of :name

  def mood
    if self.happiness > self.nausea
      "happy"
    elsif self.nausea > self.happiness
      "sad"
    end
  end

end
