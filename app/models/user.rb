class User < ActiveRecord::Base
  #validates :name, presence: true
  #validates :happiness, inclusion: { in: 1..5 }
  #validates :nausea, inclusion: { in: 1..5 }
  #validates :height, numericality: true
  #validates :tickets, numericality: true
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.happiness != nil
      if self.happiness < self.nausea
        return "sad"
      else
        return "happy"
      end
    end
  end

end
