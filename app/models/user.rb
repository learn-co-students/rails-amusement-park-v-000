class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions
  has_many :attractions, through: :rides
  validates :name, presence: true

  def mood
    if self.nausea && self.happiness
      if self.nausea >= self.happiness
        "sad"
      elsif self.nausea < self.happiness
        "happy"
      end
    end
  end

end
