class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  #validates :name, presence: true
  #validates :password, presence: true
  #validates :happiness, presence: true
  #validates :nausea, presence: true
  #validates :height, presence: true
  validates :admin, inclusion: { in: [true, false]}

  has_secure_password

  def mood
    if self.happiness && self.nausea
      if self.happiness > self.nausea
        "happy"
      else
        "sad"
      end
    end
  end

  def num_of_rides
    self.attractions.count
  end


end
