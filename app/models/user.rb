class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if nausea > happiness
      'sad'
    else
      'happy'
    end
  end

  def take_ride(ride)
    attraction = ride.attraction
    self.tickets -= attraction.tickets
    self.happiness += attraction.happiness_rating
    self.nausea += attraction.nausea_rating
    self.save
  end

end
