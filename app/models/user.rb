class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides
  validates :name, presence: true

  def mood
    if self.nausea > self.happiness
      "sad"
    end
    if self.nausea < self.happiness
      "happy"
    end
  end

  def user_name=(name)
    self.name = User.find_by(name: name)
  end

  def user_name
    self.name
  end
end
