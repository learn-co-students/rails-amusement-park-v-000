class User < ActiveRecord::Base
  
  has_many :rides
  has_many :attractions, through: :rides

  validates :name, presence: true

  has_secure_password
  
  def mood
    if self.happiness.nil? || self.nausea.nil?
      "Okay"        
    elsif self.happiness >= self.nausea
      "happy"
    else
      "sad"
    end
  end
  
end
