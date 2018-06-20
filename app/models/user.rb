class User < ActiveRecord::Base
    has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  validates_presence_of :name

  def mood
    if self.nausea && self.happiness
      if self.nausea > self.happiness
        "sad"
      else
        "happy"
      end
    else
      "unsure"
    end
  end
end
