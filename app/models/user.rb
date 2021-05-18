class User < ActiveRecord::Base
  validates :name, presence: true

  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    nausea = self.nausea
    happiness = self.happiness
    if nausea != nil && happiness != nil
      happiness > nausea ? "happy" : "sad"
    end
  end
end
