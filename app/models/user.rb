class User < ActiveRecord::Base
  validates :password, presence: true

  # Include default devise modules. Others available are:
  # :validatable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable
  # write associations here
  # has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.nausea > self.happiness
      return "sad"
    else
      return "happy"
    end
  end
end