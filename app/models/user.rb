class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides
  validates :password, presence: true, on: :create
  #validates :name, :height, :nausea, :happiness, :tickets, :presence => true

  def mood
    unless admin
      if self.nausea < self.happiness
        "happy"
      else
        "sad"
      end
    end
  end

  def user_name
    self.name
  end
end
