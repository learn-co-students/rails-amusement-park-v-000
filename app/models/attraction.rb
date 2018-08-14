class Attraction < ActiveRecord::Base
  has_many :rides
  has_many :users, through: :rides

  validates :name, :min_height, :happiness_rating, :nausea_rating, :tickets, presence: true
  validates :min_height, :inclusion => 1..100
  validates :happiness_rating, :inclusion => 1..5
  validates :nausea_rating, :inclusion => 1..5
  
end
