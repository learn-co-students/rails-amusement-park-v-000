class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides


  # validates :name, presence: true
  # validates :password, presence: true
  # validates :tickets, presence: true
  # validates :nausea, presence: true
  # validates :happiness, presence: true
  # validates :height, presence: true

  def mood
    if self.nausea && self.happiness
      if self.nausea > self.happiness
        "sad"
      elsif self.happiness > self.nausea
        "happy"
      end
    end
  end

  def is_admin?
    self.admin 
  end
end
