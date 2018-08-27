class User < ApplicationRecord
  validates :password, presence: true

  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.nausea && self.happiness
      case
      when self.happiness > self.nausea
        return "happy"
      when self.happiness < self.nausea
        return "sad"
      end
    end
  end

end
