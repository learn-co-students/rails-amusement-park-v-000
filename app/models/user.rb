class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  validates :name, presence: true, on: :create
  validates :height, presence: true, :numericality => { :greater_than_or_equal_to => 0}, on: :create
  validates :happiness, presence: true #:inclusion => {in: 1..5}
  validates :nausea, presence: true #:inclusion => {in: 1..5}
  validates :tickets, presence: true, :numericality => { :greater_than_or_equal_to => 0}
  validates :password, presence: true, on: :create

def mood
  if self.nausea > self.happiness
    "sad"
  else
    "happy"
  end
end

end
