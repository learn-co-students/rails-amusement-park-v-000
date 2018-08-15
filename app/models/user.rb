class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  validates :password, presence: true, on: :create
  validates :name, presence: true, uniqueness: true
  validates :height, inclusion: {in: 1..100, message: "must be between 1 and 100"}, on: :create, :allow_blank => true
  validates :happiness, inclusion: {in: 1..5, message: "must be between 1 and 5"}, on: :create, :allow_blank => true
  validates :nausea, inclusion: {in: 1..5, message: "must be between 1 and 5"}, on: :create, :allow_blank => true

  def mood
    unless admin
      if happiness > nausea
          "happy"
      else
         "sad"
      end
    end
  end

end
