class User < ActiveRecord::Base
  validates :name, presence: true
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def self.authenticate_credentials(name, password)
    user = User.find_by(name: name)
    user && user.authenticate(password)
  end

  def user_mood
    if happiness.to_i < nausea.to_i
      "sad"
    elsif happiness.to_i > nausea.to_i && happiness.to_i >= 3
      "happy"
    end
  end

  def pay(attraction)
    self.tickets -= attraction.tickets
    self.nausea += attraction.nausea_rating
    self.happiness += attraction.happiness_rating

    self.save
  end
end
