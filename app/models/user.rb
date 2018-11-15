class User < ApplicationRecord
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.happiness > self.nausea
      puts 'happy'
    elsif self.nausea > self.happiness
      puts 'sad'
    end
  end
end
