class User < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

  has_secure_password
  
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.admin
      'rich'
    else
      self.nausea > self.happiness ? 'sad' : 'happy'
    end
  end

end
