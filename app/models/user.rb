class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  validates :password, presence: true


  def mood
    if self.nausea > self.happiness
      return "sad"
    elsif self.nausea < self.happiness
      return "happy"
    end
  end
end
